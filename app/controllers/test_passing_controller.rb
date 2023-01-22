class TestPassingController < ApplicationController
  before_action :find_test_passing, only: %i[show update result save]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_test_passing_not_found

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

  def save
    gist_service = GistSaveService.new
    @gist = Gist.new(
      user_id: current_user.id,
      question_id: @test_passing.current_question.id,
      link: gist_service.call(@test_passing)
    )

    redirect_to @test_passing, flash_message(gist_service.success? & @gist.save)
  end

  private

  def flash_message(saved_success)
    if saved_success
      { notice: "#{t('.gist_saved')} #{view_context.link_to 'link', @gist&.link}" }
    else
      { alert: t('.gist_not_saved') }
    end
  end

  def rescue_test_passing_not_found
    render plain: 'Test_passing was not found.'
  end

  def find_test_passing
    @test_passing = TestPassing.find(params[:id])
  end

  def test_params
    params.require(:test_passing).permit(:answer_ids)
  end
end
