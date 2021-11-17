class QuestionsController < ApplicationController

  def index
    @questions = Test.find(params[:test_id]).questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit 
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.body = params[:question][:query]
    @question.save
    redirect_to "/questions/#{@question.id}"
  end

  def create
    @question = Question.create(body: params[:body], test_id: params[:test_id].to_i)
    redirect_to "/questions/#{@question.id}"
  end

  def destroy
    @question = Question.find(params[:id])
    @id = @question.id
    @body = @question.body
    @question.destroy
  end
end
