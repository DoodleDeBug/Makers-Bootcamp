
def loss(move)
  if move.downcase == "l"
    puts "Game Over: You were eaten by a werewolf"
  elsif move.downcase == "r"
    puts "Game Over: You were killed by a goblin"
  end
end

puts "Instructions: f = move forward, l = move left, r = move right. Choose a move."

points = 0

while points != 2
  move = gets.chomp

  if move.downcase == "f"
    points += 1
    if points != 2
      puts "Choose another move"
    else
      puts "You Win!"
      break
    end
  elsif move.downcase != "l" && move.downcase != "r"
    puts "That is not a valid move. Choose again"
  else
    loss(move)
    break
  end
end