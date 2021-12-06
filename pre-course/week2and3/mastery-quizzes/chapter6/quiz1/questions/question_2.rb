# Write a program that lets two players play Rock, Paper, Scissors. The program should:
# * Ask player 1 for their move.  They can input `rock`, `paper` or
#   `scissors`.
# * Ask player 2 for their move.  They can input `rock`, `paper` or
#   `scissors`.
# * Calculates who has won.  `rock` beats `scissors`, `paper` beats
#   `rock`, `scissors` beat `paper`.
# * If player 1 has won, `puts`es `Player 1 wins`.
# * If player 2 has won, `puts`es `Player 2 wins`.
# * If the game is a draw, `puts`es `It's a draw`.
#
# * Note: You can assume that players will input one of the three
#   possible moves described above.
#
# * Note: When you run the automated tests, the tests will simulate
#   the user input.  You shouldn't need to enter any input manually.
#   If the tests hang when you run them, it probably means your code
#   doesn't work correctly, yet.
#
# * Note: You can assume the players will only ever input `rock`,
#   `paper` or `scissors`.

puts "You can choose rock, paper or scissors"
puts "Player 1 move:"
p1_move = gets.chomp.downcase
puts "Player 2 move:"
p2_move = gets.chomp.downcase

if p1_move == p2_move
  puts "It's a draw"
elsif p1_move == "rock" && p2_move == "scissors" || 
  p1_move == "scissors" && p2_move == "paper" || 
  p1_move == "paper" && p2_move == "rock"
  puts "Player 1 wins"
else 
  puts "Player 2 wins"
end
