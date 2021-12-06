require "mastery_answer_code_quality"

describe "Q2. People grouper" do
  context "user asks to put 5 people into 1 group, prints the group" do
    let (:user_input) { ["1\n",
                         "Mary\n",
                         "Lauren\n",
                         "Awad\n",
                         "Govind\n",
                         "Isla\n",
                         "stop\n",
                         "1\n",
                         "stop\n"] }
    let (:expected_output) { "Mary, Lauren, Awad, Govind, Isla\n" }

    it "outputs one group with all five people in it" do
      set_user_input_and_check_expected_output
    end
  end

  context "user asks to put 0 people into 1 group, and output 1 empty group" do
    let (:user_input) { ["1\n",
                         "stop\n",
                         "1\n",
                         "stop\n"] }
    let (:expected_output) { "\n" }

    it "outputs one empty group" do
      set_user_input_and_check_expected_output
    end
  end

  context "user asks to put 5 people into 3 groups, prints all 3 groups" do
    let (:user_input) { ["3\n",
                         "Mary\n",
                         "Lauren\n",
                         "Awad\n",
                         "Govind\n",
                         "Isla\n",
                         "stop\n",
                         "1\n",
                         "2\n",
                         "3\n",
                         "stop\n"] }
    let (:expected_output) {
      ["Mary, Govind",
       "Lauren, Isla",
       "Awad"].join("\n.*")
    }

    it "outputs three groups, two people first two, one person in third" do
      set_user_input_and_check_expected_output
    end
  end

  context "user asks to put 0 people into 3 groups, prints all 3 groups" do
    let (:user_input) { ["3\n",
                         "stop\n",
                         "1\n",
                         "2\n",
                         "3\n",
                         "stop\n"] }
    let (:expected_output) {
      ["",
       "",
       ""].join("\n.*")
    }

    it "outputs three groups, all groups empty" do
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
