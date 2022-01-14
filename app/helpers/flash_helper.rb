module FlashHelper
  def aaa
    msgs = ''
    flash.each do |type, msg|
      puts "msg= #{msg}"
      msgs << content_tag(:p, "#{type} : #{msg}", class: 'flash alert')
    end
    msgs.html_safe
  end
end