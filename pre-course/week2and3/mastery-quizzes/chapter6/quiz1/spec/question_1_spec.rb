require "mastery_answer_code_quality"

describe "Q1. Add up many numbers" do

  context "user enters just `stop`" do
    let(:user_input) { ["stop\n"] }
    let(:total) { "0\n" }

    it "`puts`es `0`" do
      set_user_input_and_check_expected_output
    end
  end

  context "user enters `3` and `stop`" do
    let(:user_input) { ["3\n", "stop\n"] }
    let(:total) { "3\n" }

    it "`puts`es the total (3)" do
      set_user_input_and_check_expected_output
    end
  end

  context "user enters `5`, `4`, `3`, `2`, `1` and `stop`" do
    let(:user_input) { ["5\n", "4\n", "3\n", "2\n", "1\n", "stop\n"] }
    let(:total) { "15\n" }

    it "`puts`es the total (15)" do
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

    expect { load "questions/question_1.rb" }
      .to output(/#{total}/).to_stdout
  end
end
