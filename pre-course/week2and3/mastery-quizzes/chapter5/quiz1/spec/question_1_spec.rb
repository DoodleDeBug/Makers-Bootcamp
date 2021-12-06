require "mastery_answer_code_quality"

describe "Q1. Magic 8 ball" do
  let (:responses) { ["It is certain",
                    "It is decidedly so",
                    "Ask again later",
                    "Outlook not so good",
                    "Very doubtful"] }

  it "always `puts`es one of the magic 8 ball responses" do
    20.times do
      expect { load "questions/question_1.rb" }
        .to output(/#{responses.join("|")}$/).to_stdout
    end
  end

  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end
end
