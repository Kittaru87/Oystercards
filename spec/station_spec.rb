require 'station'

describe Station do

  subject { described_class.new("Old Street", 1) }

  it "returns a station name" do
    expect(subject).to have_attributes(name: "Old Street")
  end

  it "returns a station name" do
    expect(subject).to have_attributes(zone: 1)
  end

end