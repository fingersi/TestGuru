class TestPassingController < ApplicationController
  before_action :find_test_passing, only: %i[ show update result]

  def show
  end

  def result
  end

  def update
    @test_passing.accept!(params[:answer_ids])

    if @test_passing.completed?

      redirect_to result_test_passing_path(@test_passing)
    else
      render :show
    end
  end

  private

  def find_test_passing
    @test_passing = TestPassing.find(params[:id])
  end
end
