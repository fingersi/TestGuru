class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_test_not_found

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
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  def edit
  end

  def create
    @test = Test.new(convert_params(test_params))

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: "Test was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: "Test was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
    end
  end

  private

  def rescue_test_not_found
    render plain: 'Test was not found.'
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:author_id, :level, :title, :category_id)
  end
end
