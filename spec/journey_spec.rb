require 'journey'

describe Journey do

    let(:station) { double :station, zone: 1}
    let(:other_station) { double :other_station, zone: 2 }

    it 'responds to entry station' do
        expect(subject.start_journey(station)).to eq station
    end

    it 'responds to exit station' do
        expect(subject.end_journey(other_station)).to eq other_station
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
    
end
