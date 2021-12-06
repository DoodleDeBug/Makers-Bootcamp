require "api_request"

describe ApiRequest do
  let :path { "/hi" }
  let :params { { a: "b" } }
  let :api_report_class { double(:api_report_class) }
  let :api_report { double(:api_report) }

  describe "::new" do
    context "successful request" do
      before(:each) do
        stub_request(:get, /67.205.138.167\/hi/)
          .with(query: params).to_return(status: 200)
      end

      it "creates and exposes report" do
        expect(api_report_class)
          .to receive(:build)
          .with(an_instance_of(HTTParty::Response))
          .and_return(api_report)

        subject = described_class.new(path, params, api_report_class)
        expect(subject.report).to eq(api_report)
      end
    end

    context "unsuccessful request" do
      before(:each) do
        stub_request(:get, /67.205.138.167\/hi/).with(query: params).to_timeout
      end

      it "creates and exposes report" do
        expect(api_report_class)
          .to receive(:build)
          .with(an_instance_of(Net::OpenTimeout))
          .and_return(api_report)

        subject = described_class.new(path, params, api_report_class)
        expect(subject.report).to eq(api_report)
      end
    end
  end
end
