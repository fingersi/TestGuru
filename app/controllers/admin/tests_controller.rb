class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_short]
  before_action :set_test, only: %i[show edit update destroy update_short]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_test_not_found
  rescue_from ActiveRecord::InvalidForeignKey, with: :rescue_question_exists

  def index
  end

  def show 
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: 'Test was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: 'Test was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_short
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: 'Test was successfully updated.'
    else
      render :index
    end
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path, notice: 'Test was successfully destroyed.'
    else
      flash.alert = 'Test has not been deleted. There are undeleted questions.'
      render :show
    end
  end

  private

  def rescue_test_not_found
    render plain: 'Test was not found.'
  end

  def rescue_question_exists
    render :show, alert: 'Test has not been deleted. There are undeleted questions or test_passings.'
  end

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:author_id, :level, :title, :category_id)
  end
end
