module AnswerHeaderHelper

  def answer_header(answer)
    if answer.new_record?
      "<h2>Create New #{link_to answer.question.body} Question</h2>".html_safe
    else
      "<h2>Edit #{link_to answer.question.body} Question</h2>".html_safe
    end
  end
  
end
