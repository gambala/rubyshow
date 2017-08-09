# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: %i(show edit update destroy approve)
  helper_method :language_options, :paid_options

  def index
    respond_to do |format|
      format.html do
        query = CoursesQuery.new(Course.all, courses_query_params).call
        render locals: { query: query }
      end
      format.js { render js: "Turbolinks.visit('#{request.original_url}');" }
    end
  end

  def show
    authorize @course, :show?

    @comments = @course.comments.comment
    @opinions = @course.comments.opinion
    @questions = @course.comments.question
    @opinion = @course.comments.build(kind: Comment.kinds[:opinion])
    @comment = @course.comments.build(kind: Comment.kinds[:comment])
    @question = @course.comments.build(kind: Comment.kinds[:question])
    @rating = @course.rating
  end

  def new
    @course = Course.new
  end

  def edit
    authorize @course, :edit?
  end

  def create
    @course = Course.new(course_params)

    authorize @course, :create?

    if verify_recaptcha(model: @course) && @course.save
      redirect_to root_path, notice: 'Спасибо за предложенный курс!'
    else
      render :new
    end
  end

  def update
    authorize @course, :update?

    if @course.update(course_params)
      redirect_to @course, notice: 'Курс успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    authorize @course, :destroy?

    @course.destroy!
    redirect_to root_path, notice: 'Курс удален.'
  end

  def approve
    authorize @course, :approve?

    @course.approve!
    redirect_to @course, notice: 'Курс одобрен.'
  end

  private

  def language_options
    @language_options ||= [['На всех языках', 'all'],
                           ['На русском', 'Русский'],
                           ['На английском', 'English']]
  end

  def paid_options
    @paid_options ||= [['Платные и бесплатные', 'all'],
                       ['Только платные', '1'],
                       ['Только бесплатные', '0']]
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :language, :url, :paid)
  end

  def courses_query_params
    params.permit(:title, :language, :paid)
  end
end
