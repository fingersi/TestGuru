module ApplicationHelper
  def flash_alert
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end

  def user_name
    if loggen_in?
      content_tag :p, "Welcome, #{current_user.login} Guru", class: 'user nav'
    else
      link_to 'Register', signup_path
    end
  end

  def log_in_log_out
    if loggen_in?
      link_to 'Logout', login_path, method: :delete
    else
      link_to 'Login', login_path
    end
  end
end
