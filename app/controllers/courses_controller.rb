class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :set_course, only: [:show, :edit, :update, :destroy, :approve]
  helper_method :language_options, :paid_options

  def index
    queried_courses = CoursesQuery.new(courses_query_params, Course.all)
    render locals: { queried_courses: queried_courses }
  end

  def show
    @comments = @course.comments
    @comment = @course.comments.build
    @rating = @course.rating
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to root_path, notice: 'Спасибо за предложенный курс!'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Курс успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy!
    redirect_to root_path, notice: 'Курс удален.'
  end

  def approve
    @course.approve!
    redirect_to @course, notice: 'Курс одобрен.'
  end

  private

  def language_options
    language_options ||= [['На всех языках', 'all'], 'Русский', 'English']
  end

  def paid_options
    paid_options ||= [['И платные, и бесплатные', 'all'],
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
