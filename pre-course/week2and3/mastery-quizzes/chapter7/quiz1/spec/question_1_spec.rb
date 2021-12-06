require "mastery_answer_code_quality"

describe "Q1. Bar grapher" do
  context "user enters single number: 10" do
    let (:user_input) { "10\n" }
    let (:expected_output) { "----------\n" }

    it "outputs single bar of 10 dashes" do
      set_user_input_and_check_expected_output
    end
  end


  context "user enters many numbers: 10,4,2,7,5,1" do
    let (:user_input) { "10,4,2,7,5,1\n" }
    let (:expected_output) {
      ["----------",
       "----",
       "--",
       "-------",
       "-----",
       "-"].join("\n")
    }

    it "outputs one bar for each number" do
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
