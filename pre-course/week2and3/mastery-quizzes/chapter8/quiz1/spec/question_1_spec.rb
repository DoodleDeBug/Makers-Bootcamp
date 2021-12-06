require "mastery_answer_code_quality"

describe "Q1. Scrabble scorer" do
  context "word with three blanks" do
    let (:user_input) { " A  " }
    let (:expected_output) { "1\n" }

    it "`puts`es score for non-blank letter (1)" do
      set_user_input_and_check_expected_output
    end
  end

  context "word with all the letters in the alphabet" do
    let (:user_input) { ("A".."Z").to_a.join("") }
    let (:expected_output) { "87\n" }

    it "`puts`es score for word (87)" do
      set_user_input_and_check_expected_output
    end
  end

  context "word with repeated letters" do
    let (:user_input) { "GOOD" }
    let (:expected_output) { "6\n" }

    it "`puts`es score for all letters (6)" do
      set_user_input_and_check_expected_output
    end
  end



  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end

  def set_user_input_and_check_expected_output
    allow_any_instance_of(Object)
      .to receive(:gets).and_return(user_input)

    expect { load "questions/question_1.rb" }
      .to output(/#{expected_output}/).to_stdout
  end
end
