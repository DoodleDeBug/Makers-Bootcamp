require "httparty"
require_relative "./api_report"

class ApiRequest
  attr_reader :report

  def initialize(path, params, api_report_class=ApiReport)
    @path = path
    @params = params
    @report = api_report_class.build(make_request)
  end

  private

  API_SERVER_HOST = "http://67.205.138.167/"

  def make_request
    begin
      HTTParty.get(URI.join(API_SERVER_HOST, path), query: params)
    rescue *REQUEST_EXCEPTIONS => e
      e
    end
  end

  REQUEST_EXCEPTIONS = [Timeout::Error,
                        Errno::EINVAL,
                        Errno::ECONNRESET,
                        Errno::ENETUNREACH,
                        EOFError,
                        Net::HTTPBadResponse,
                        Net::HTTPHeaderSyntaxError,
                        Net::ProtocolError]

  attr_reader :path, :params
end
