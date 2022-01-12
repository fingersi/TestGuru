class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  helper_method :current_user,
                :loggen_in?

  private

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def loggen_in?
    @current_user.present?
  end
end
