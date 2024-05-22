module QuestionsHelper
  def question_header(question)
    if question.present?
      "Edit #{question.test.title} Question"
    else
      'Create New Question'
    end
  end
end
