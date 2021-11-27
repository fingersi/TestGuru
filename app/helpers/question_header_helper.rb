module QuestionHeaderHelper

  def question_header(question)
    if question.new_record?
      "<h2>Create New #{link_to question.test.title} Question</h2>".html_safe
    else
      "<h2>Edit #{link_to question.test.title} Question</h2>".html_safe
    end
  end
end