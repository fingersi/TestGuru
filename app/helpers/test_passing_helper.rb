module TestPassingHelper
  def result_final_text(test_passing)
    if test_passing.successfull?
      { color: 'green', text: 'Test has been completed' }
    else
      { color: 'red', text: 'Test has not been completed' }
    end
  end
end
