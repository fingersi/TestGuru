class Admin::AnswersController < Admin::BaseController

  before_action :find_answer, only: %i[destroy edit update]
  before_action :find_question, only: %i[new create]

  def index
  end

  def edit
  end

  def new
    @answer = Answer.new(question_id: @question.id)
  end

  def create
    if @question.answers.push(Answer.new(answer_params))
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
    puts "params[:question_id]#{params[:question_id]}"

    @question = Question.find(params[:question_id].to_i)
    puts "@question.answers #{@question.answers.first}"
    @question
  end

  def find_answer
    puts "params :id #{params[:id]}"
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:value, :correct)
  end
end
