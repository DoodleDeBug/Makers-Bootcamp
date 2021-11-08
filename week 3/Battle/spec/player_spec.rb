require 'player'

describe Player do
  it "Returns a given name" do
    player = Player.new("Bob")
    expect(player.name).to eq "Bob" 
  end
end