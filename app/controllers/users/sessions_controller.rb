class Users::SessionsController < Devise::SessionsController

  def create
    super
    flash.notice = "Welcome, #{current_user.first_name } #{current_user.last_name}." unless
                    current_user.first_name.empty? || current_user.last_name.empty?
  end
end
