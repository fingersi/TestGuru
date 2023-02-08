class TestsController < ApplicationController

  before_action :set_test, only: %i[start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_test_not_found
  rescue_from ActiveRecord::InvalidForeignKey, with: :rescue_question_exists

  def index
    @tests = Test.for_users
  end

  def start
    unless @test.valid1?
      redirect_to tests_path, alert: t('.start_error')
      return
    end

    @test_passing = TestPassing.new(user_id: current_user.id, test_id: @test.id, level: @test.level)
    if @test_passing.save
      redirect_to test_passing_path(@test_passing)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:author_id, :level, :title, :category_id)
  end
end
