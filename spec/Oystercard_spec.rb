require 'Oystercard'

  describe OysterCard do
    let(:entry_station) { double :entry_station }
    let(:exit_station) {double :exit_station }

    it 'shows me my default balance' do
        expect(subject.balance).to eq OysterCard::DEFAULT_BALANCE
    end

    it 'no track history as default' do
      expect(subject).to have_attributes(track_history: [])
    end 

    describe "#top_up" do

    it 'can top up the balance' do
      expect{ subject.top_up 1}.to change{ subject.balance }.by 1
    end

    it "will fail if you try and top up past the maximum balance allowed, #{OysterCard::MAXIMUM_BALANCE}" do
      expect{subject.top_up(91)}.to raise_error "You cant top up more than #{OysterCard::MAXIMUM_BALANCE} balance"
    end

  end

  describe "#touch_in" do 

    it 'will remember entry station on touch in' do
      subject.top_up(5)
      expect(subject.touch_in(entry_station)).to eq "You have tapped into #{entry_station}"
    end
    
    it 'returns that I am not in journey if I dont touch in' do
      expect{subject.in_journey?}.to raise_error 'You are not in journey'
    end

    it 'will return that the card is in journey if i touch in' do
      subject.top_up(2)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to eq true
    end

    it "will not let me through the barrier if my balance is less than #{OysterCard::MINIMUM_FARE}" do
      expect{subject.touch_in(entry_station)}.to raise_error "You have insufficient funds"
    end 
  
  end

  describe "touch_out" do

    it "deduct correct fare from balance" do
      subject.top_up(40)
      subject.touch_in(entry_station)
      expect {subject.touch_out(exit_station)}.to change{subject.balance}.by(-OysterCard::MINIMUM_FARE)
    end

    it 'it will remember exit station on tap out' do
      subject.top_up(50)
      subject.touch_in(entry_station)
      expect(subject.touch_out(exit_station)).to eq "You have tapped out of #{exit_station}"
    end

  end
  
  context 'TTT' do
    before(:each) do
      subject.top_up(50)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
    end

    it 'will forget entry station on touch out' do
      expect(subject).to have_attributes(entry_station: nil)
    end

    it 'returns the exit station when required' do
      expect(subject).to have_attributes(exit_station: exit_station)
    end

    it 'expect track history to store entry and exit station upon touch out' do
      expect(subject).to have_attributes(track_history: [{ entry_station=>exit_station }])
    end
  end
    
end
