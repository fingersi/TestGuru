class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]
  before_action :find_question, except: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def new
    @question = Question.new()
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_question_not_found
    render plain: 'Question was not found.'
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
