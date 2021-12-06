require "mastery_answer_code_quality"

describe "Q3. Fibonacci sequence" do
  let(:expected) { ["0",
	                  "1",
                    "1",
                    "2",
                    "3",
                    "5",
                    "8",
                    "13",
	                  "21",
                    "34",
                    "55",
                    "89",
                    "144",
                    "233",
                    "377",
                    "610",
                    "987",
                    "1597",
                    "2584",
                    "4181"].join("\n") }

  it "`puts`es first 20 Fibonacci numbers" do
    expect { load "questions/question_3.rb" }
      .to output(/#{expected}$/).to_stdout
  end

  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end
end
