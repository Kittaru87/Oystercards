require 'Oystercard'

describe Oystercard do

  it "should have a default balance of 0" do
    expect(subject).to have_attributes(balance: 0)
  end
  
  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe "#top_up" do
  
    it "should top up the balance by 20" do
      expect { subject.top_up(20) }.to change { subject.balance }.by(20)
    end

    it "should tell the customer how much they've topped up by" do
      expect(subject.top_up(20)).to eq "You have topped up by £20"
    end

    it "should raise an error if balance limit is exceeded" do
      expect { subject.top_up(95) }.to raise_error("Top-up limit exceeded")
    end

    it "should raise an error if balance limit is exceeded" do
      subject.top_up(50)
      expect { subject.top_up(45) }.to raise_error("Top-up limit exceeded")
    end

  end

  describe "#deduct" do

    it "should deduct fare from the balance" do
      subject.top_up(20)  
      expect { subject.deduct(5) }.to change { subject.balance }.by(-5)
    end

  end

    
end