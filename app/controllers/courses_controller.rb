class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :set_course, only: [:show, :edit, :update, :destroy, :approve]

  def index
    @courses = filter_courses(Course.includes(:comments)).approved
    @type = 'Все курсы'
  end

  def paid
    @courses = Course.paid
    @type = 'Платные курсы'
    render :index
  end

  def free
    @courses = Course.free
    @type = 'Бесплатные курсы'
    render :index
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

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :language, :url, :paid)
  end

  def filter_courses(courses)
    title = params[:title] unless params[:title].blank?
    paid = params[:paid] if %w(1 0).include?(params[:paid])
    language = params[:language] if %w(Русский English).include?(params[:language])

    courses = courses.where('title ILIKE ?', "%#{title}%") if title.present?
    courses = courses.where(paid: paid) if paid.present?
    courses = courses.where(language: language) if language.present?
    courses
  end
end
