module ApplicationHelper

  def user_name
    if user_signed_in?
      content_tag :p, "Welcome, #{current_user.login} Guru", class: 'nav link'
    else
      link_to 'Register', new_user_registration_path, class: 'nav link'
    end
  end

  def log_in_log_out
    if user_signed_in?
      link_to 'Logout', destroy_user_session_path, method: :delete, class: 'nav link'
    else
      link_to 'Login', new_user_session_path, class: 'nav link'
    end
  end
end
