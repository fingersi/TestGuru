class TestPassingController < ApplicationController
  before_action :find_test_passing, only: %i[show update result save]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_test_passing_not_found

  rescue_from ActionController::ParameterMissing, with: :rescue_no_answers_sent

  def show
  end

  def result
  end

  def update
    @test_passing.accept!(test_params)
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

  def rescue_no_answers_sent
    flash.now[:alert] = t('.no_answers')
    render :show
  end

  def flash_message(saved_success)
    if saved_success
      { notice: "#{t('.gist_saved')} #{view_context.link_to 'link', @gist&.link}" }
    else
      { alert: t('.gist_not_saved') }
    end
  end

  def rescue_test_passing_not_found
    redirect_to root_path, alert: t('.no_test_passing')
  end

  def find_test_passing
    @test_passing = TestPassing.find(params[:id])
  end

  def test_params
    params.require(:answer_ids)
  end
end
