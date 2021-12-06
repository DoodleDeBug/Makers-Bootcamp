require "api_report"

describe ApiReport do
  describe "::new" do
    subject { described_class.new(:success, "Woo!") }

    it "creates a new ApiReport with status and message" do
      expect(subject).to_not be_nil
    end
  end

  describe "#to_s" do
    subject { described_class.new(:success, "Woo!") }

    it "reports the status and message" do
      expect(subject.to_s).to eq("API communication: success\nWoo!")
    end
  end

  describe "#build" do
    context "http response" do
      context "not ok" do
        let :http_response { double(:http_response, ok?: false, message: "Error") }
        subject { described_class.build(http_response) }

        it "reports failure" do
          expect(subject.to_s).to match(/API communication: failed/)
        end

        it "reports message" do
          expect(subject.to_s).to match(/Error/)
        end
      end

      context "ok" do
        let :http_response { double(:http_response, ok?: true, body: "Woo") }
        subject { described_class.build(http_response) }

        it "reports failure" do
          expect(subject.to_s).to match(/API communication: success/)
        end

        it "reports message" do
          expect(subject.to_s).to match(/Woo/)
        end
      end
    end

    context "exception" do
      let :failure_message { "Oh no" }
      subject { described_class.build(Exception.new("Oh no")) }

      it "reports failure" do
        expect(subject.to_s).to match(/API communication: failed/)
      end

      it "reports message" do
        expect(subject.to_s).to match(/Oh no/)
      end
    end
  end
end
