class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def complete_form
  end

  def update
    if current_user.update(complete_params)
      redirect_to right_first_page
    else
      render :complete_form
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation, :firt_name, :last_name)
  end

  def complete_params
    params.permit(:first_name, :last_name)
  end
end
