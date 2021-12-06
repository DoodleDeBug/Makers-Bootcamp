require "mastery_answer_code_quality"

describe "Q3. Group by favourite thing" do
  context "user inputs `sport` as characteristic to group people by" do
    let (:user_input) { "sport\n" }
    let (:expected_output) { ["squash",
                              "Mary",
                              "Lauren",
                              "Govind",
                              "weightlifting",
                              "Isla",
                              "Awad",
                              "cycling",
                              "Sam",
                              "Will"].join("\n.*") }

    it "`puts`es people grouped by sport" do
      set_user_input_and_check_expected_output
    end
  end

  context "user inputs `fruit` as characteristic to group people by" do
    let (:user_input) { "fruit\n" }
    let (:expected_output) { ["blackberry",
                              "Mary",
                              "Will",
                              "orange",
                              "Lauren",
                              "Sam",
                              "banana",
                              "Isla",
                              "Govind",
                              "kiwi",
                              "Awad"].join("\n.*") }

    it "`puts`es people grouped by sport" do
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

    expect { load "questions/question_3.rb" }
      .to output(/#{expected_output}/).to_stdout
  end
end
