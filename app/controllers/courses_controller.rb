class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :set_course, only: [:show, :edit, :update, :destroy, :approve]

  def index
    @courses = Course.approved.first(25)
    @type = 'Лучшие курсы'
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
      redirect_to @course, notice: 'Кур был успешно обновлен.'
    else
      render :edit
    end
  end

  def approve
    @course.approve!
    redirect_to @course, notice: 'Курс был одобрен.'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :language, :url, :paid)
  end
end
