require "safe_ruby"

describe "Q1. Fill in the blanks in arithmetic calculations" do
  let (:user_code) {
    File.read(File.join(File.dirname(__FILE__),
                        "../questions/question_1.rb"))
  }

  it "defines `five` by filling in the blank" do
    expect(safely_read_local_variable(user_code, "five")).to eq(5)
  end

  it "defines `seven` by filling in the blank" do
    expect(safely_read_local_variable(user_code, "seven")).to eq(7)
  end

  it "defines `two` by filling in the blanks" do
    expect(safely_read_local_variable(user_code, "two")).to eq(2)
  end

  it "defines `three_point_zero` by filling in the blank" do
    expect(safely_read_local_variable(user_code, "three_point_zero"))
      .to eq(3.0)
  end

  it "defines `two_is_integer` by filling in the blank" do
    expect(safely_read_local_variable(user_code, "two_is_integer")).to be true
  end

  it "defines `four` by filling in the blank" do
    expect(safely_read_local_variable(user_code, "four")).to eq(4)
  end

  it "defines `zero` by filling in the blank" do
    expect(safely_read_local_variable(user_code, "zero")).to eq(0)
  end

  def safely_read_local_variable(code, variable_name)
    SafeRuby.eval("#{code}\n#{variable_name}")
  end
end
