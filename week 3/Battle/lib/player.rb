class Player
  attr_reader :name, :hp
  def initialize(name)
    @name = name
    @hp = 60
  end

  def receive_damage
    @hp -= 10
  end
end