require "mastery_answer_code_quality"

describe "Q1. FizzBuzz to 20" do
  let(:expected) { ["1",
                    "2",
                    "Fizz",
                    "4",
                    "Buzz",
                    "Fizz",
                    "7",
                    "8",
                    "Fizz",
                    "Buzz",
                    "11",
                    "Fizz",
                    "13",
                    "14",
                    "FizzBuzz",
                    "16",
                    "17",
                    "Fizz",
                    "19",
                    "Buzz"].join("\n") }

  it "`puts`es numbers 1 - 20, except Fizz if divisible by 3, Buzz if divisible by 5, FizzBuzz if divisible by 3 and 5" do
    expect { load "questions/question_1.rb" }
      .to output(/#{expected}$/).to_stdout
  end

  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end
end
