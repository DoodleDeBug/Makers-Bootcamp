require "mastery_answer_code_quality"

describe "Q4. Big adventure" do
  context "immediately quit" do
    let(:user_input) { ["quit\n"] }
    let(:expected_output) { "Bye!" }

    it "`puts`es bye" do
      set_user_input_and_check_expected_output
    end
  end

  context "look, quit" do
    let(:user_input) { ["look\n", "quit\n"] }
    let(:expected_output) {
      ["You are standing in a hall with a marble floor. You see a door.\n",
       "Bye!\n"]
        .join(".*")
    }

    it "`puts`es hall description, bye" do
      set_user_input_and_check_expected_output
    end
  end

  context "look, incorrect command in hall, quit" do
    let(:user_input) { ["look\n", "blah\n", "quit\n"] }
    let(:expected_output) {
      ["You are standing in a hall with a marble floor. You see a door.\n",
       "Bye!\n"]
        .join(".*")
    }

    it "`puts`es hall description, bye" do
      set_user_input_and_check_expected_output
    end
  end

  context "north to study, look, quit" do
    let(:user_input) { ["north\n", "look\n", "quit\n"] }
    let(:expected_output) {
      ["You are in a warm and cosy study. You see a safe. You see a desk.\n",
       "Bye!\n"]
        .join(".*")
    }

    it "`puts`es study description, bye" do
      set_user_input_and_check_expected_output
    end
  end

  context "north to study, look, incorrect command, quit" do
    let(:user_input) { ["north\n", "look\n", "blah\n", "quit\n"] }
    let(:expected_output) {
      ["You are in a warm and cosy study. You see a safe. You see a desk.\n",
       "Bye!\n"]
        .join(".*")
    }

    it "`puts`es study description, bye" do
      set_user_input_and_check_expected_output
    end
  end

  context "go between hall and study many times, look each time, quit" do
    let(:user_input) { ["look\n",

                        "north\n",
                        "look\n",

                        "south\n",
                        "look\n",

                        "north\n",
                        "look\n",

                        "south\n",
                        "look\n",

                        "quit\n"] }
    let(:expected_output) {
      ["You are standing in a hall with a marble floor. You see a door.\n",
       "You are in a warm and cosy study. You see a safe. You see a desk.\n",
       "You are standing in a hall with a marble floor. You see a door.\n",
       "You are in a warm and cosy study. You see a safe. You see a desk.\n",
       "You are standing in a hall with a marble floor. You see a door.\n",
       "Bye!\n"]
        .join(".*")
    }

    it "`puts`es descriptions of both rooms several times, bye" do
      set_user_input_and_check_expected_output
    end
  end

  context "north to study, look at desk, quit" do
    let(:user_input) { ["north\n", "look at desk\n", "quit\n"] }
    let(:expected_output) {
      ["You see a piece of paper that reads, The combination is 2451.\n",
       "Bye!\n"]
        .join(".*")
    }

    it "`puts`es desk description, bye" do
      set_user_input_and_check_expected_output
    end
  end

  context "north to study, enter combination" do
    let(:user_input) { ["north\n", "enter combination 2451\n"] }
    let(:expected_output) {
      "You see some diamonds in the safe, pick them up and make your escape\n"
    }

    it "`puts`es win description" do
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

    expect { load "questions/question_4.rb" }
      .to output(/#{expected_output}/m).to_stdout
  end
end
