class Users::SessionsController < Devise::SessionsController


  def create

    super
    flash.notice = "Welcome, #{current_user.full_name}." if
                    current_user.first_name.present? || current_user.last_name.present?
  end
end
