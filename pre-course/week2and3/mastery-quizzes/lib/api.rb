require_relative "./api_request"

module Api
  def self.get_quiz(student_quiz,
                    api_request_class=ApiRequest)
    api_request_class
      .new("/get_quiz",
           { github_username: student_quiz.github_username,
             chapter_number: student_quiz.chapter_number,
             quiz_number: student_quiz.quiz_number })
      .report
      .to_s +
      "\nNow use `git pull` to get the quiz"
  end

  def self.submit_and_verify_quiz_answers(student_quiz,
                                          api_request_class=ApiRequest)
    api_request_class
      .new("/submit_and_verify_quiz_answers",
           { github_username: student_quiz.github_username,
             chapter_number: student_quiz.chapter_number,
             quiz_number: student_quiz.quiz_number })
      .report
      .to_s
  end
end
