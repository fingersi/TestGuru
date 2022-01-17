module ApplicationHelper

  def user_name
    if loggen_in?
      content_tag :p, "Welcome, #{current_user.login} Guru", class: 'nav link'
    else
      link_to 'Register', signup_path, class: 'nav link'
    end
  end

  def log_in_log_out
    if loggen_in?
      link_to 'Logout', login_path, method: :delete, class: 'nav link'
    else
      link_to 'Login', login_path, class: 'nav link'
    end
  end
end
