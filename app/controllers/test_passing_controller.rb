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
    @gist = GistSaveService.new.call(@test_passing, current_user)
    puts "@gist.valid? #{@gist.valid?}"
    puts "@gist.link #{@gist.link.to_s}"
    if @gist.save
      puts "gist.save true"
      flash = { notice: "#{t('.gist_saved')} #{view_context.link_to 'link', @gist&.link}"}
    else
      puts "gist.save false"
      flash = { alert: t('.gist_not_saved') }
    end
    puts "result: #{result}"
    puts "result.class: #{result.class}"
    puts "flash: #{flash}"
    puts "flash.class: #{flash.class}"
    redirect_to @test_passing, flash
  end

  private

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
