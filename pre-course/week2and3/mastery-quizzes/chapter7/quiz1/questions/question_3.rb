# Write a game where the player swims down a river infested with
# crocodiles.  The game should:
# * Use the `river` variable that defines the river (see code below).
#   * `-`: clear water.
#   * `C`: crocodile.
#   * The first five characters represent the first part of the river.
#     The second five characters represent the second part of the
#     river.  And so on.
# * Define the player as one character wide.
# * Start the player at the central position of the first part of the
#   river.
#   * e.g. `C-P--`.
# * Each turn:
#   * Check to see if the player is in the same position as a
#     crocodile.  If they are, `puts` `You were eaten.' and stop the
#     program.
#   * `puts` the whole river.  Include a `P` where the player is.
#   * Ask the player if they want to go to left, right or neither.
#     The player enters `left`, `right` or `neither`.
#   * Make the player float down the river by one river part (one line
#     of digits).  Move them to the left, the right, or keep them
#     where they are.
# Print `You survived!` if the player makes it past all parts of the
# river without hitting a crocodile.
#
# * Note: To stop the game when the user is eaten or survives the
#   whole river, don't use `exit` to quit the program because this
#   will break the automated tests.  To exit a while loop early, use
#   the `break` keyword.
#
# * Note: You can assume the player will never move outside the
#   boundary of the river when they choose left and right.  You can
#   also assume the player will always enter either `left`, `right` or
#   `neither`.
#
# * Example output:
#   ```
#   --P--
#   --C--
#   CC-CC
#   CC-CC
#   Type left, right or neither
#   left
#   -----
#   -PC--
#   CC-CC
#   CC-CC
#   Type left, right or neither
#   right
#   -----
#   --C--
#   CCPCC
#   CC-CC
#   Type left, right or neither
#   neither
#   -----
#   --C--
#   CC-CC
#   CCPCC
#   Type left, right or neither
#   neither
#   You survived!
#   ```

level = 1
index = 2

def display_river(lvl, index)
  
  player = "P"

  river = "-----,--C--,CC-CC,CC-CC"
  river_array = river.split(",")
  level_array = river_array[lvl - 1].split("")
  level_array[index] = player

  river_array[lvl - 1] = level_array.join("")

  return river_array
end

def eaten?(index, lvl)
  river = "-----,--C--,CC-CC,CC-CC"
  river_array = river.split(",")
  level_array = river_array[lvl - 1].split("")

  if level_array[index] == "C"
    return true
  end
end

while true
  puts display_river(level, index)
  puts "Type left, right or neither"

  if eaten?(index, level) == true
    puts "You were eaten."
    break
  end

  if level < 4
    move = gets.chomp

    if move == "left"
      index -= 1
    elsif move == "right"
      index += 1
    end

    level += 1
  else
    puts "You survived!"
    break
  end

  

end