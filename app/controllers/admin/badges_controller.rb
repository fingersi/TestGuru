class Admin::BadgesController < ApplicationController

  before_action :set_badge, only: %i[show edit update]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def show; end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      flash.alert = t('.cannot_save_badge')
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:title,
                                  :categories,
                                  :category_ids,
                                  :level,
                                  :published,
                                  :activated,
                                  :first_time,
                                  :image_id)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def find_image
    @image = Image.find(params[:image_id])
  end
end