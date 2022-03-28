module TestPassingHelper
  def result_final_text(test_passing)
    if test_passing.successfull?
      { color: 'green', text: t('test_passing.result.success') }
    else
      { color: 'red', text: t('test_passing.result.bad_result') }
    end
  end
end
