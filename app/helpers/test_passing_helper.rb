module TestPassingHelper
  def result_final_text(test_passing)
    if test_passing.successfull?
      { color: 'green', text: t('test_passing.result.success') }
    else
      { color: 'red', text: t('test_passing.result.bad_result') }
    end
  end

  def earned_badge(test_passing)
    return '' if test_passing&.badges.empty?

    test_passing.badges.map do |badge|
      "<td  vertical-align='middle'>#{content_tag :span, badge.title, class: 'badge-title'}</td>
      <td>#{image_tag badge.picture_path, alt: badge.title, size: 150}</td>"
    end.unshift("<h3> #{t('earned_badges')} </h3>").join(' ')
  end
end
