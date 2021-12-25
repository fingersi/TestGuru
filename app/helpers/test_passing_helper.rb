module TestPassingHelper

  def result_final_text(successfull)
    if successfull
      '<h1><font size="6" color= "green" face="serif">Test has been completed</font></h1>'.html_safe
    else
      '<h1><font size="6" color= "red" face="serif">Test has not been completed</font></h1>'.html_safe
    end
  end

  def result_mark(successfull, mark)
    if successfull
      "<p><font size='6' color= 'green' face='serif'>Your mark: #{mark} %</font></p>".html_safe
    else
      "<p><font size='6' color= 'red' face='serif'>Your mark: #{mark} %</font></p>".html_safe
    end
  end
end
