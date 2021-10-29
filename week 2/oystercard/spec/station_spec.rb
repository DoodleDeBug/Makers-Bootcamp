require_relative './../lib/station'

describe Station do

  station = Station.new(name: "Camden", zone: 1)

  it 'has a zone property' do
    expect(station.zone).to eq(1)
  end

  it 'has a name property' do
    expect(station.name).to eq("Camden")
  end

end