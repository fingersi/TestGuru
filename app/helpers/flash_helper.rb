module FlashHelper
  def flash_alerts
    flash.each do |type, msg|
      content_tag :p, "#{type} : #{msg}", class: "flash #{type}" 
    end
  end
end