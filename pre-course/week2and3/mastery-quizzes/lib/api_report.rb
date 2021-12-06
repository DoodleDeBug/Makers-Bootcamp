class ApiReport
  def initialize(status, message)
    @status = status
    @message = message
  end

  def to_s
    "API communication: #{status}\n" \
    "#{message}"
  end

  def self.build(response)
    return self.error(response.to_s) if exception?(response)
    return self.error(response.message) if !response.ok?
    self.success(response.body)
  end

  private

  def self.success(body)
    new(:success, body)
  end

  def self.error(message)
    new(:failed,
        "Error: #{message}\n" \
        "Please report this error to maryrosecook.")
  end

  def self.exception?(response)
    response.is_a? Exception
  end

  attr_reader :status, :message
end
