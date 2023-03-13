class Admin::BadgesController < ApplicationController

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def show
    @badge = Badge.find(params[:id])
  end

  def create
    @badge = badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :category, :level, :category_id, :published)
  end
end


