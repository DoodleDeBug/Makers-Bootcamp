describe "Q1. Height" do
  it "`puts`es the height of the learner as a number" do
    expect { require_relative "../questions/question_1" }
      .to output(/\d+/).to_stdout
  end
end
