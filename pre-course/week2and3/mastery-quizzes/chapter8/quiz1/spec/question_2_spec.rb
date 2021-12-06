require "mastery_answer_code_quality"

describe "Q2. Find people with same favourite thing" do
  context "user inputs `sport` as category and `squash` as value" do
    let (:user_input) { ["sport\n", "squash\n"] }
    let (:expected_output) { ["Mary",
                              "Lauren",
                              "Govind"].join("\n.*") }

    it "`puts`es people who like squash" do
      set_user_input_and_check_expected_output
    end
  end

  context "user inputs `fruit` as category and `kiwi` as value" do
    let (:user_input) { ["fruit\n", "kiwi\n"] }
    let (:expected_output) { "Awad\n" }

    it "`puts`es people who like kiwis" do
      set_user_input_and_check_expected_output
    end
  end

  context "user inputs `fruit` as category and `mango` as value" do
    let (:user_input) { ["fruit\n", "mango\n"] }
    let (:expected_output) { "" }

    it "`puts`es people who like mango (no one)" do
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
      .to output(/#{expected_output}/m).to_stdout
  end
end
