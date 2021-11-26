module QuestionHeaderHelper

  def question_header
    if @test
      "<h2>Create New #{link_test(@test.title)} Question</h2>".html_safe
    else
      "<h2>Edit #{link_test(@question.test.title)} Question</h2>".html_safe
    end
  end

  def link_test(title)
    test_id = @test ? @test.id : @question.test.id
    link_to title, test_questions_path(test_id)
  end
end