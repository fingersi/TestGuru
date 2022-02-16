class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(resource_or_scope)
    if current_user.last_name.nil?
      guru_complete_form_path
    else
      right_first_page
    end
  end

  def right_first_page
    if current_user.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
end
