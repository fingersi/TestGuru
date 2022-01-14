class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(login: params[:login]) || User.find_by(email: params[:login])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:original_url] || root_path
    else
      flash.now[:alert] = 'Login or Password was incorrect.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
