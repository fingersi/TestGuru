class TestsController < ApplicationController
  before_action :set_test, only: %i[ show edit update destroy start ]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def start
    @test_passing = TestPassing.new(user_id: User.second.id, test_id: @test.id, level: @test.level)
    if @test_passing.save!
      redirect_to test_passing_path(@test_passing)
    else
      render show
    end
  end

  def edit
  end

  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.fetch(:test, {})
    end
end
