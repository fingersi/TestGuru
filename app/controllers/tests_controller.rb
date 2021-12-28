class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_test_not_found
  rescue_from ActiveRecord::InvalidForeignKey, with: :rescue_question_exists

  def index
    @tests = Test.all
  end

  def show
    redirect_to test_questions_path(@test)
  end

  def new
    @test = Test.new
  end

  def start
    @test_passing = TestPassing.new(user_id: User.second.id, test_id: @test.id, level: @test.level)
    if @test_passing.save
      redirect_to test_passing_path(@test_passing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test, notice: 'Test was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Test was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: 'Test was successfully destroyed.'
  end

  private

  def rescue_test_not_found
    render plain: 'Test was not found.'
  end

  def rescue_question_exists
    render plain: 'Test has not been deleted. There are undeleted questions.'
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:author_id, :level, :title, :category_id)
  end
end
