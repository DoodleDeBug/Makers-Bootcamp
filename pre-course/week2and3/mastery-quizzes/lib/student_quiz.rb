class StudentQuiz
  attr_reader :github_username, :chapter_number, :quiz_number

  def initialize(github_username:, chapter_number:, quiz_number:)
    check_arguments(github_username, chapter_number, quiz_number)

    @github_username = github_username
    @chapter_number = chapter_number
    @quiz_number = quiz_number
  end

  private

  def check_arguments(github_username, chapter_number, quiz_number)
    raise "Invalid GitHub username: #{github_username}" \
      if !github_username_valid?(github_username)

    raise "Invalid chapter number: #{chapter_number}" \
      if !chapter_number_valid?(chapter_number)

    raise "Invalid quiz number: #{quiz_number}" \
      if !quiz_number_valid?(quiz_number)
  end

  def github_username_valid?(github_username)
    github_username.length > 0
  end

  def chapter_number_valid?(chapter_number)
    chapter_number.to_i > 0
  end

  def quiz_number_valid?(quiz_number)
    quiz_number.to_i == 1
  end
end
