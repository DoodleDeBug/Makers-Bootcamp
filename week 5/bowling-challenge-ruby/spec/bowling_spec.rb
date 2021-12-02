# frozen_string_literal: true

require_relative '../lib/bowling'

describe Bowling do
  describe '#calculate_score' do
    it 'calculates the total score of a gutter game to be 0:' do
      game = Bowling.new
      game.calculate_score({
        frame_1: [0, 0],
        frame_2: [0, 0],
        frame_3: [0, 0],
        frame_4: [0, 0],
        frame_5: [0, 0],
        frame_6: [0, 0],
        frame_7: [0, 0],
        frame_8: [0, 0],
        frame_9: [0, 0],
        frame_10: [0, 0]
      })

      expect(game.score).to eq 0
    end

    it 'calculates the total score of a perfect game to be 300:' do
      game = Bowling.new
      game.calculate_score({
        frame_1: [10],
        frame_2: [10],
        frame_3: [10],
        frame_4: [10],
        frame_5: [10],
        frame_6: [10],
        frame_7: [10],
        frame_8: [10],
        frame_9: [10],
        frame_10: [10, 10, 10]
      })

      expect(game.score).to eq 300
    end

    it 'calculates the total score of a game with no spares or strikes:' do
      game = Bowling.new
      game.calculate_score({
        frame_1: [2, 5], # 7
        frame_2: [2, 5], # 7
        frame_3: [2, 5], # 7
        frame_4: [7, 1], # 8
        frame_5: [3, 0], # 3
        frame_6: [1, 1], # 2
        frame_7: [1, 5], # 6
        frame_8: [9, 0], # 9
        frame_9: [6, 1], # 7
        frame_10: [5, 2] # 7
      })

      expect(game.score).to eq 63
    end

    it 'calculates the total score of a game with a spare:' do
      game = Bowling.new
      game.calculate_score({
        frame_1: [5, 5], # 12
        frame_2: [2, 5], # 7
        frame_3: [2, 5], # 7
        frame_4: [7, 1], # 8
        frame_5: [3, 0], # 3
        frame_6: [1, 1], # 2
        frame_7: [1, 5], # 6
        frame_8: [9, 0], # 9
        frame_9: [6, 1], # 7
        frame_10: [5, 2] # 7
      })

      expect(game.score).to eq 68
    end

    it 'calculates the total score of a game multiple spares:' do
      game = Bowling.new
      game.calculate_score(
        {
          frame_1: [5, 5], # 12
          frame_2: [2, 8], # 12
          frame_3: [2, 5], # 7
          frame_4: [7, 1], # 8
          frame_5: [3, 7], # 11
          frame_6: [1, 1], # 2
          frame_7: [1, 5], # 6
          frame_8: [9, 1], # 16
          frame_9: [6, 1], # 7
          frame_10: [5, 2] # 7
        }
      )

      expect(game.score).to eq 88
    end

    it 'calculates the total score of a game with a spare in the 10th frame:' do
      game = Bowling.new
      game.calculate_score({
        frame_1: [5, 1], # 6
        frame_2: [2, 5], # 7
        frame_3: [2, 5], # 7
        frame_4: [7, 1], # 8
        frame_5: [3, 0], # 3
        frame_6: [1, 1], # 2
        frame_7: [1, 5], # 6
        frame_8: [9, 0], # 9
        frame_9: [6, 1], # 7
        frame_10: [5, 5, 7] # 17
      })

      expect(game.score).to eq 72
    end

    it 'calculates the total score of a game with all spares:' do
      game = Bowling.new
      game.calculate_score({
        frame_1: [5, 5], # 12
        frame_2: [2, 8], # 12
        frame_3: [2, 8], # 17
        frame_4: [7, 3], # 13
        frame_5: [3, 7], # 11
        frame_6: [1, 9], # 11
        frame_7: [1, 9], # 19
        frame_8: [9, 1], # 16
        frame_9: [6, 4], # 15
        frame_10: [5, 5, 7] # 17
      })

      expect(game.score).to eq 143
    end

    it 'calculates the total score of a game with a strike:' do
      game = Bowling.new
      game.calculate_score({
        frame_1: [10], # 17
        frame_2: [2, 5], # 7
        frame_3: [2, 5], # 7
        frame_4: [7, 1], # 8
        frame_5: [3, 0], # 3
        frame_6: [1, 1], # 2
        frame_7: [1, 5], # 6
        frame_8: [9, 0], # 9
        frame_9: [6, 1], # 7
        frame_10: [5, 2] # 7
      })

      expect(game.score).to eq 73
    end
  end
end
