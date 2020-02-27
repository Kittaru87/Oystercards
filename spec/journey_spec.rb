require 'journey'

describe Journey do

    let(:station) { double(name: :station, zone: 1)}
    let(:other_station) { double(name: :other_station, zone: 1)}

    it 'initializes with an empty journey' do
        expect(subject).to have_attributes(current_journey = {})
    end

    it 'calculates a fare' do
        subject.start_journey(station)
        subject.end_journey(station)
        expect(subject.fare).to eq 1
    end

    it "knows if a journey is not complete" do
        expect(subject).not_to be_complete
    end

    it "knows if a journey is complete" do
        subject.start_journey(station)
        subject.end_journey(other_station)
        expect(subject).to be_complete
    end

    it "returns a penalty fare if no exit station given" do
        expect(subject.fare).to eq Journey::PENALTY
    end

    it 'expect current_journey to store entry and exit station upon touch out' do
        subject.start_journey(station)
        subject.end_journey(other_station)
        expect(subject).to have_attributes(current_journey: { :departures=>station.name,:arrivals=>other_station.name })
      end

    it 'will return that the card is in journey if i touch in' do
      subject.start_journey(station)
      expect(subject.in_journey?).to eq true
    end

end
