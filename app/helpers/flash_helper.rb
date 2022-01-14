module FlashHelper
  def flash_alerts
    msgs = ''
    flash.each do |type, msg|
      msgs += content_tag(:p, "#{type} : #{msg}", class: 'flash alert')
    end
    msgs.html_safe
  end
end