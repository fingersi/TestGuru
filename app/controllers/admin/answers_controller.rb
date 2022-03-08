class Admin::AnswersController < Admin::BaseController

  before_action :find_answer, only: %i[destroy edit update]
  before_action :find_question, only: %i[new create]

  def index
  end

  def edit
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.push(Answer.new(answer_params))
    if @answer.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_question_path(@answer.question)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question)
  end

  private

  def find_question
    @question = Question.find(params[:question_id].to_i)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:value, :correct)
  end
end
