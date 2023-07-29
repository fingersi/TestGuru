class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_short]
  before_action :set_test, only: %i[show edit update destroy update_short]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_test_not_found

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
      redirect_to admin_test_path(@test), notice: t('test_updated')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: t('test_updated')
    else
      flash.now[:alert] = @test.errors.first ? @test.errors.first.options[:message] : t('.test_cannot_save')
      render :edit, status: :unprocessable_entity
    end
  end

  def update_short
    if @test.update(test_params_short)
      redirect_to admin_tests_path, notice: t('test_updated')
    else
      render :index
    end
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path, notice: t('test_destroyed')
    else
      flash.alert = t('test_not_destroyed')
      render :show
    end
  end

  private

  def rescue_test_not_found
    redirect_to admin_test_path, alert: 'Test was not found.'
  end

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:author_id, :level, :title, :category_id, :published, :time_limit)
  end

  def test_params_short
    params.require(:test).permit(:title)
  end
end
