module TestPassingHelper
  def result_final_text(test_passing)
    if test_passing.successfull?
      { color: 'green', text: t('test_passing.result.success') }
    else
      { color: 'red', text: t('test_passing.result.bad_result') }
    end
  end

  def earned_badge(test_passing)
    result = ''
    if test_passing.badges.present?
      result += "<h3> #{t('earned_badges')} </h3>"
      test_passing.badges.each do |badge|
        result += "<td  vertical-align='middle'>
                  #{content_tag :span, badge.title, class: 'badge-title'}
                  </td>
                  <td>
                    #{image_tag badge.image.picture_path, alt: badge.image.discription}
                  </td> "
      end
    end
    result
  end
end
