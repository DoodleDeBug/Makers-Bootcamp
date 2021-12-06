require "student_quiz"

describe StudentQuiz do
  describe "::new" do
    describe "data availability" do
      subject { described_class.new(github_username: "maryrosecook",
                                    chapter_number: "2",
                                    quiz_number: "1") }

      it "exposes github_username" do
        expect(subject.github_username).to eq("maryrosecook")
      end

      it "exposes chapter_number" do
        expect(subject.chapter_number).to eq("2")
      end

      it "exposes quiz_number" do
        expect(subject.quiz_number).to eq("1")
      end
    end

    describe "catching data errors" do
      it "raises if github_username empty" do
        expect { described_class.new(github_username: "",
                                     chapter_number: "2",
                                     quiz_number: "1")}
          .to raise_error(/Invalid GitHub username: /)
      end

      it "raises if chapter_number doesn't parse to a number > 0" do
        expect { described_class.new(github_username: "maryrosecook",
                                     chapter_number: "boo",
                                     quiz_number: "1")}
          .to raise_error(/Invalid chapter number: boo/)
      end

      it "raises if quiz_number doesn't parse to a number > 0" do
        expect { described_class.new(github_username: "maryrosecook",
                                     chapter_number: "2",
                                     quiz_number: "woo")}
          .to raise_error(/Invalid quiz number: woo/)
      end

      it "raises if quiz_number greater than 1" do
        expect { described_class.new(github_username: "maryrosecook",
                                     chapter_number: "2",
                                     quiz_number: "3")}
          .to raise_error(/Invalid quiz number: 3/)
      end
    end
  end
end
