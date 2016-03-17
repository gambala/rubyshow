class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_course, only: [:new, :create, :index]
  def new
    @question = Question.new
  end

  def create
    @question = @course.questions.build(question_params)
    @question.user_id = current_user.id

    if @question.save
      redirect_to course_questions_path(@course), notice: 'Спасибо за предложенный вопрос!'
    else
      render :new
    end
  end

  def index
    @questions = @course.questions
  end

  def show
    @answer = Answer.new
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
