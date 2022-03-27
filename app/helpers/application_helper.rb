module ApplicationHelper

  def user_name
    if user_signed_in?
      content_tag :p, t('menu.welcome', user: current_user.login), class: 'nav link'
    else
      link_to t('menu.register'), new_user_registration_path, class: 'nav link'
    end
  end

  def log_in_log_out
    if user_signed_in?
      link_to t('menu.logout'), destroy_user_session_path, method: :delete, class: 'nav link'
    else
      link_to t('menu.login'), new_user_session_path, class: 'nav link'
    end
  end
end
