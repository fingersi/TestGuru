class Admin::BaseController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_admin

  private

  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'You are not permited to view this page'
    end
  end
end
