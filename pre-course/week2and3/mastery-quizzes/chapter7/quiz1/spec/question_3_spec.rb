require "mastery_answer_code_quality"

describe "Q3. Crocodile river" do
  context "player inputs `neither`" do
    let (:user_input) { ["neither\n"] }
    let (:expected_output) {
      [["--P--",
        "--C--",
        "CC-CC",
        "CC-CC"].join("\n"),
       "You were eaten.$"
      ].join("\n.*")
    }

    it "outputs river before first turn, then You were eaten!" do
      set_user_input_and_check_expected_output
    end
  end

  context "player inputs `right, neither`" do
    let (:user_input) { ["right\n", "neither\n"] }
    let (:expected_output) {
      [["--P--",
        "--C--",
        "CC-CC",
        "CC-CC"].join("\n"),
       ["-----",
        "--CP-",
        "CC-CC",
        "CC-CC"].join("\n"),
       "You were eaten.$"
      ].join("\n.*")
    }

    it "outputs river at each turn, then You were eaten!" do
      set_user_input_and_check_expected_output
    end
  end

  context "player inputs `right, left, right`" do
    let (:user_input) { ["right\n", "left\n", "right\n"] }
    let (:expected_output) {
      [["--P--",
        "--C--",
        "CC-CC",
        "CC-CC"].join("\n"),
       ["-----",
        "--CP-",
        "CC-CC",
        "CC-CC"].join("\n"),
       ["-----",
        "--C--",
        "CCPCC",
        "CC-CC"].join("\n"),
       "You were eaten.$"
      ].join("\n.*")
    }

    it "outputs river at each turn, then You were eaten!" do
      set_user_input_and_check_expected_output
    end
  end

  context "player moves left, right, neither, neither" do
    let (:user_input) { ["left\n",
                         "right\n",
                         "neither\n",
                         "neither\n"] }
    let (:expected_output) {
      [["--P--",
        "--C--",
        "CC-CC",
        "CC-CC"].join("\n"),
       ["-----",
        "-PC--",
        "CC-CC",
        "CC-CC"].join("\n"),
       ["-----",
        "--C--",
        "CCPCC",
        "CC-CC"].join("\n"),
       ["-----",
        "--C--",
        "CC-CC",
        "CCPCC"].join("\n"),
       "You survived!$"
      ].join("\n.*")
    }

    it "outputs river at each turn, then You survived!" do
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

    expect { load "questions/question_3.rb" }
      .to output(/#{expected_output}/m).to_stdout
  end
end
