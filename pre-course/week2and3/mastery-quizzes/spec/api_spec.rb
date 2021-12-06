require "api"

describe Api do
  let :student_quiz { double(:student_quiz,
                             github_username: "maryrosecook",
                             chapter_number: "2",
                             quiz_number: "1") }
  let :api_request_class { double(:api_request_class) }
  let :request { double(:request) }
  let :report { double(:report) }

  describe "::get_quiz" do
    it "sends request and returns report" do
      expect(request).to receive(:report).and_return(report)
      expect(api_request_class)
        .to receive(:new)
        .with("/get_quiz",
              { github_username: "maryrosecook",
                chapter_number: "2",
                quiz_number: "1"})
        .and_return(request)

      expect(report).to receive(:to_s).and_return("API result")
      expect(described_class.get_quiz(student_quiz, api_request_class))
        .to eq("API result" +
               "\nNow use `git pull` to get the quiz")
    end
  end

  describe "::submit_and_verify_quiz_answers" do
    it "sends request and returns report" do
      expect(request).to receive(:report).and_return(report)
      expect(api_request_class)
        .to receive(:new)
        .with("/submit_and_verify_quiz_answers",
              { github_username: "maryrosecook",
                chapter_number: "2",
                quiz_number: "1"})
        .and_return(request)

      expect(report).to receive(:to_s).and_return("API result")
      expect(described_class.submit_and_verify_quiz_answers(
               student_quiz, api_request_class))
        .to eq("API result")
    end
  end
end
