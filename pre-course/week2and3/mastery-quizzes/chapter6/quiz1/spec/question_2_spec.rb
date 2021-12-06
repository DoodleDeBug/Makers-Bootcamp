require "mastery_answer_code_quality"

describe "Q2. Rock, paper, scissors" do
  context "player 1: rock, player 2: rock" do
    let(:user_input) { ["rock\n", "rock\n"] }
    let(:expected_output) { "It's a draw" }

    it "`puts`es It's a draw" do
      set_user_input_and_check_expected_output
    end
  end

  context "player 1: paper, player 2: paper" do
    let(:user_input) { ["paper\n", "paper\n"] }
    let(:expected_output) { "It's a draw" }

    it "`puts`es It's a draw" do
      set_user_input_and_check_expected_output
    end
  end

  context "player 1: scissors, player 2: scissors" do
    let(:user_input) { ["scissors\n", "scissors\n"] }
    let(:expected_output) { "It's a draw" }

    it "`puts`es It's a draw" do
      set_user_input_and_check_expected_output
    end
  end

  context "player 1: rock, player 2: scissors" do
    let(:user_input) { ["rock\n", "scissors\n"] }
    let(:expected_output) { "Player 1 wins" }

    it "`puts`es Player 1 wins" do
      set_user_input_and_check_expected_output
    end
  end

  context "player 1: paper, player 2: rock" do
    let(:user_input) { ["paper\n", "rock\n"] }
    let(:expected_output) { "Player 1 wins" }

    it "`puts`es Player 1 wins" do
      set_user_input_and_check_expected_output
    end
  end

  context "player 1: scissors, player 2: paper" do
    let(:user_input) { ["scissors\n", "paper\n"] }
    let(:expected_output) { "Player 1 wins" }

    it "`puts`es Player 1 wins" do
      set_user_input_and_check_expected_output
    end
  end

  context "player 1: rock, player 2: paper" do
    let(:user_input) { ["rock\n", "paper\n"] }
    let(:expected_output) { "Player 2 wins" }

    it "`puts`es Player 2 wins" do
      set_user_input_and_check_expected_output
    end
  end

  context "player 1: paper, player 2: scissors" do
    let(:user_input) { ["paper\n", "scissors\n"] }
    let(:expected_output) { "Player 2 wins" }

    it "`puts`es Player 2 wins" do
      set_user_input_and_check_expected_output
    end
  end

  context "player 1: scissors, player 2: rock" do
    let(:user_input) { ["scissors\n", "rock\n"] }
    let(:expected_output) { "Player 2 wins" }

    it "`puts`es Player 2 wins" do
      set_user_input_and_check_expected_output
    end
  end

  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end

  def set_user_input_and_check_expected_output
    allow_any_instance_of(Object)
      .to receive(:gets).and_return(*user_input)

    expect { load "questions/question_2.rb" }
      .to output(/#{expected_output}/).to_stdout
  end
end
