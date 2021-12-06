describe "Q2. Arithmetic" do
  it "`puts`es result of multiplying `TWELVE` by `FOURTEEN` by `SIXTEEN`" do
    expect { load "questions/question_2.rb" }
      .to output(/2688/).to_stdout
  end
end
