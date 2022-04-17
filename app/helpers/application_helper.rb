module ApplicationHelper

  def user_name
    if user_signed_in?
      " #{t('menu.welcome')}, #{current_user.login} #{t('menu.guru')} "
    else
      link_to t('menu.register'), new_user_registration_path
    end
  end

  def log_in_out
    if user_signed_in?
      link_to(t('menu.logout'), destroy_user_session_path, method: :delete, class: "link-secondary")
    else
      link_to(t('menu.login'), new_user_session_path)
    end
  end

  def flash_class1(level)
    classes = {
      notice: 'alert alert-info',
      success: 'alert alert-success',
      error: 'alert alert-danger',
      alert: 'alert alert-warning'
    }

    classes[level.to_sym]
  end
end
