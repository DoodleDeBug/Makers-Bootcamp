require "mastery_answer_code_quality"

describe "Q3. Little adventure" do
  context "move north to cave, move north to win" do
    let(:user_input) { ["north\n", "north\n"] }
    let(:expected_output) {
      ["You are in a scary cave.",
       "You walk into sunlight."]
        .join("\n.*")
    }

    it "`puts`es cave description, win description" do
      set_user_input_and_check_expected_output
    end
  end

  context "incorrect command in passage, move north to cave, move north" do
    let(:user_input) { ["blah\n", "north\n", "north\n"] }
    let(:expected_output) { ["You are in a scary cave.\n",
                             "You walk into sunlight.\n"] }

    it "no error, `puts`es cave description, win description" do
      set_user_input_and_check_expected_output
    end
  end

  context "move north and south several times, then north twice" do
    let(:user_input) { ["north\n",
                        "south\n",

                        "north\n",
                        "south\n",

                        "north\n",
                        "south\n",

                        "north",
                        "north"] }
    let(:expected_output) {
      ["You are in a scary cave.",
       "You are in a scary passage.",

       "You are in a scary cave.",
       "You are in a scary passage.",

       "You are in a scary cave.",
       "You are in a scary passage.",

       "You are in a scary cave.",
       "You walk into sunlight."]
        .join("\n.*")
    }

    it "`puts`es descriptions of both rooms several times, win description" do
      set_user_input_and_check_expected_output
    end
  end

  context "move north to cave, incorrect command in cave, move north" do
    let(:user_input) { ["north\n", "blah\n", "north\n"] }
    let(:expected_output) { ["You are in a scary cave.\n",
                             "You walk into sunlight.\n"] }

    it "`puts`es cave description, no error, `puts`es win description" do
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
