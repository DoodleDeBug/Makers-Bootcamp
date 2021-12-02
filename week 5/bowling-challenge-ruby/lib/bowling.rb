# frozen_string_literal: true

class Bowling
  attr_reader :score

  def initialize
    @score = 0
  end

  def calculate_score(results)

      results.each_pair do |frame, rolls|

        index = frame.to_s[-1].to_i # turn the key into a string, grab the last character, turn it into an int
        next_frame = results["frame_#{index + 1}".to_sym]

        if rolls.sum != 10 # not a spare or strike
          @score += rolls.sum
        elsif rolls.sum === 10 && rolls.length == 1 # a strike
          if next_frame.length === 1 #strikes in a row
            next_next_frame = results["frame_#{index + 2}".to_sym]
            @score = @score + rolls.sum + next_frame[0] + next_next_frame[0] # add the next two rolls (both single roll frames aka strikes-in-a-row)
          else
            @score = @score + rolls.sum + next_frame[0] + next_frame[1]# adds the first 2 rolls of the next frame
          end
        else # a spare
          @score = @score + rolls.sum + next_frame[0] # add the first roll of the next frame
        end

      end
  end
end
