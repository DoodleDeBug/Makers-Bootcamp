require_relative "../questions/question_1"
require "mastery_answer_code_quality"

describe "Q1. Blackjack" do
  describe "#random_card" do
    it "returns all the cards in the suit" do
      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(0)
      expect(random_card).to eq("two")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(1)
      expect(random_card).to eq("three")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(2)
      expect(random_card).to eq("four")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(3)
      expect(random_card).to eq("five")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(4)
      expect(random_card).to eq("six")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(5)
      expect(random_card).to eq("seven")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(6)
      expect(random_card).to eq("eight")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(7)
      expect(random_card).to eq("nine")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(8)
      expect(random_card).to eq("ten")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(9)
      expect(random_card).to eq("jack")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(10)
      expect(random_card).to eq("queen")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(11)
      expect(random_card).to eq("king")

      expect_any_instance_of(Object).to receive(:rand).with(13).and_return(12)
      expect(random_card).to eq("ace")
    end
  end

  describe "#move" do
    context "user inputs hit" do
      let (:user_input) { "hit\n" }

      it 'returns `"hit"`' do
        allow_any_instance_of(Object).to receive(:gets).and_return(user_input)
        expect(move).to eq("hit")
      end
    end

    context "user inputs stick" do
      let (:user_input) { "stick\n" }

      it 'returns `"stick"`' do
        allow_any_instance_of(Object).to receive(:gets).and_return(user_input)
        expect(move).to eq("stick")
      end
    end

    context "user inputs blah and then a valid move" do
      let (:user_input) { ["blah\n", "hit\n"] }

      it 'returns valid move (`"hit"`)' do
        allow_any_instance_of(Object).to receive(:gets).and_return(*user_input)
        expect(move).to eq("hit")
      end
    end
  end

  describe "#score" do
    describe "individual cards" do
      it 'scores `"two"` as 2' do
        expect(score(["two"])).to eq(2)
      end

      it 'scores `"three"` as 3' do
        expect(score(["three"])).to eq(3)
      end

      it 'scores `"four"` as 4' do
        expect(score(["four"])).to eq(4)
      end

      it 'scores `"five"` as 5' do
        expect(score(["five"])).to eq(5)
      end

      it 'scores `"six"` as 6' do
        expect(score(["six"])).to eq(6)
      end

      it 'scores `"seven"` as 7' do
        expect(score(["seven"])).to eq(7)
      end

      it 'scores `"eight"` as 8' do
        expect(score(["eight"])).to eq(8)
      end

      it 'scores `"nine"` as 9' do
        expect(score(["nine"])).to eq(9)
      end

      it 'scores `"ten"` as 10' do
        expect(score(["ten"])).to eq(10)
      end

      it 'scores `"jack"` as 10' do
        expect(score(["jack"])).to eq(10)
      end

      it 'scores `"queen"` as 10' do
        expect(score(["queen"])).to eq(10)
      end

      it 'scores `"king"` as 10' do
        expect(score(["king"])).to eq(10)
      end

      it 'scores `"ace"` as 11' do
        expect(score(["ace"])).to eq(11)
      end
    end

    describe "adding up card scores" do
      it 'scores `"two"`, `"jack"` and `"ace"` as 23' do
        expect(score(["two", "jack", "ace"])).to eq(23)
      end
    end
  end

  describe "#run_game" do
    describe "showing score so far as game is played" do
      let (:user_input) { ["hit\n",
                           "hit\n",
                           "stick\n"] }

      let (:expected_output) { ["Score so far: 7",
                                "Score so far: 17"].join("\n.*") }

      it "`puts`es scores for two hits" do
        srand(1)
        set_user_input_and_check_expected_output
      end
    end

    describe "`puts`ing outcome of game" do
      context "player takes too many cards and busts" do
        let (:user_input) { ["hit\n",
                             "hit\n",
                             "hit\n",
                             "stick\n"] }

        let (:expected_output) { "You busted with: 28\n" }

        it "`puts`es You busted with: 28" do
          srand(1)
          set_user_input_and_check_expected_output
        end
      end

      context "player doesn't take too many cards" do
        let (:user_input) { ["hit\n",
                             "hit\n",
                             "stick\n"] }

        let (:expected_output) { "You scored: 17\n" }

        it "`puts`es You scored: 17" do
          srand(1)
          set_user_input_and_check_expected_output
        end
      end
    end

    def set_user_input_and_check_expected_output
      allow_any_instance_of(Object)
        .to receive(:gets).and_return(*user_input)

      expect { run_game }
        .to output(/#{expected_output}/m).to_stdout
    end
  end

  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end
end
