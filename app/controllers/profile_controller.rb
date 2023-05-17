class ProfileController < ApplicationController

  before_action :find_user, only: %i[show update]

  def show
    @user_badges = TestPassing.where('user_id = :user and badge_id > 0', { user: user_params[:id] })
  end

  def update
    if @user.update(user_update_params)
      redirect_to profile_path(@user), notice: t('.user_updated')
    else
      flash.now[:alert] = @user.errors.first ? @user.errors.first.options[:message] : t('.test_cannot_save')
      render :show, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(user_params[:id])
  end

  def find_user_update
    @user = User.find(user_update_params[:id])
  end

  def user_params
    params.permit(:id, :lang)
  end

  def user_update_params
    current_user.admin? ? admin_form_params : user_form_params
  end

  def admin_form_params
    params.require(:admin).permit(:login, :email, :first_name, :last_name)
  end

  def user_form_params
    params.require(:user).permit(:login, :email, :first_name, :last_name)
  end
end
