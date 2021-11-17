class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index]
  before_action :find_question, except: %i[index] 

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def edit
  end

  def update
    @question.body = params[:question][:query]
    @question.save
    redirect_to "/questions/#{@question.id}"
  end

  def create
    @question = Question.create(body: params[:body], test_id: params[:test_id].to_i)
    redirect_to "/questions/#{@question.id}"
  end

  def destroy
    @id = @question.id
    @body = @question.body
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
end
