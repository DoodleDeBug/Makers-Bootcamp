# Write a program that lets a user play a solo game of
# Blackjack. The program should:
# * Ask the player if they want to "hit" or "stick".
#   * If the player hits, add a card to their hand (which starts empty unlike real Blackjack)
#   * If the player sticks, end the game.
# * Keep asking the player if they want to "hit" or "stick" until they
#   say "stick".
# * Each time the player hits, calculate the score for the player's
#   hand and `puts` `Score so far: ` and the score.
#   * e.g. `Score so far: 23`
#   * A score is calculated by adding up the values of each of the
#     cards in the player's hand.
#   * Value for each card:
#     * "two": 2
#     * "three": 3
#     * "four": 4
#     * "five": 5
#     * "six": 6
#     * "seven": 7
#     * "eight": 8
#     * "nine": 9
#     * "ten": 10
#     * "jack": 10
#     * "queen": 10
#     * "king": 10
#     * "ace": 11 (This is slightly different from real Blackjack.)
# * When the game is over, `puts` the outcome of the game.
#   * If the player's score is `<= 21`, `puts` `You scored: ` and the
#     final score
#     * e.g. `You scored: 20`
#   * If the player's score is `> 21`, `puts` `You busted with: ` and
#     the final score.
#     * e.g. `You busted with: 25`

# * As part of your solution, there should be four specific methods:
#   * `random_card`: This has already been written for you.  You don't
#     need to change it.
#   * `move`: Asks the player for a move.  If they enter `hit` or
#     `stick`, it returns the move.  If they enter something else, it
#     keeps asking them until they enter `hit` or `stick`.
#   * `score`: Takes an array of cards and returns the score for the
#     hand as an integer.
#   * `run_game`: uses the other methods to run a game of Blackjack.
#
# * Note: To stop the game when the user sticks, don't use `exit` to
#   quit the program because this will break the automated tests.  To
#   exit a while loop early, use the `break` keyword.
#
# * Note: When you run the automated tests, make sure to remove from
#   the top level of the file any calls to `run_test` or any other
#   methods.

# You don't need to change this method!
def random_card
  cards = ["two", "three", "four", "five", "six", "seven",
           "eight", "nine", "ten",
           "jack", "queen", "king", "ace"]

  cards[rand(13)]
end

def move
  puts "Do you want to hit or stick"
  input = gets.chomp

  if input != "hit" && input != "stick"
    move
  else 
    return input
  end
end

def score(cards)

  points_tally = 0

  card_values = {
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
    "ten" => 10,
    "jack" => 10,
    "queen" => 10,
    "king" => 10,
    "ace" => 11,
  }

  cards.each do |card|
    points_tally += card_values[card]
  end

  return points_tally
end

def run_game
  hand = []

  while true
    input = move

    if input == "stick"
      
      if score(hand) <= 21 
        puts "You scored: #{score(hand)}"
      else
        puts "You busted with: #{score(hand)}" 
      end

      break

    elsif input == "hit"
      hand.push(random_card)
      puts "Score so far: #{score(hand)}"
    else
      input
    end

  end
end