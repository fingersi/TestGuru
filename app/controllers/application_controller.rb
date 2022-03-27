class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_locale

  private

  def default_url_options
    { lang: set_url }
  end

  def after_sign_in_path_for(resource_or_scope)
    resource_or_scope.admin? ? admin_tests_path : tests_path
  end

  def configure_permitted_parameters
    added_attrs = [:login, :email, :first_name, :last_name, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def set_url
    puts "params[:lang]&.to_sym == I18n.default_locale #{params[:lang]&.to_sym == I18n.default_locale}"
    params[:lang]&.to_sym == I18n.default_locale ? nil : I18n.locale
  end
end
