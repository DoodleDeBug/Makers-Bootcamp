class Game

  attr_reader :player_1, :player_2

    def initialize(p1, p2)
      @player_1 = p1
      @player_2 = p2
    end

  
  def attack(player)
    player.receive_damage
  end

end