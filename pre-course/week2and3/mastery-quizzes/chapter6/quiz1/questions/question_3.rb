# Write an adventure game that the player plays from the command line
# by typing in the commands `north` and `south`.  The game should have
# this behaviour:
# * Two rooms: a passage and a cave.
#   * Passage commands
#     * `north`: `puts`es `You are in a scary cave.`
#   * Cave commands
#     * `south`: `puts`es `You are in a scary passage.`
#     * `north`: `puts`es 'You walk into sunlight.` and the program
#                stops executing.
# * The player starts in the passage.
# * When the player starts the game, the game shouldn't `puts` a room
#   description until the player moves between rooms.
# * If the player enters a command that is incorrect for the
#   situation, nothing happens and nothing is `puts`ed.
#
# * Note: To stop the program when the user wins, don't use `exit` to
#   quit the program because this will break the automated tests.  To
#   exit a while loop early, use the `break` keyword.
#
# * Note: When you run the automated tests, the tests will simulate
#   the user input.  You shouldn't need to enter any input manually.
#   If the tests hang when you run them, it probably means your code
#   doesn't work correctly, yet.
# 
# * Note: To pass the tests, you'll need to `puts` exactly what's
#   expected. Watch out for stray punctuation, capital letters, etc.

position = "passage"

while true
  command = gets.chomp.downcase

  if command == "quit"
    puts "Bye!"
    break
  else
    if position == "passage"
      if command == "north"
        position = "cave"
        puts "You are in a scary cave."
      end
    else
      if command == "south"
        position = "passage"
        puts "You are in a scary passage."
      elsif command == "north"
        puts "You walk into sunlight."
        break
      end
    end
  end
end