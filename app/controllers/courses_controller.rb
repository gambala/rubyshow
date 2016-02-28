class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @paid_courses = Course.where(paid: true, approved: true).sort_by {|course| course.rating }.reverse
    @free_courses = Course.where(paid: false, approved: true).sort_by {|course| course.rating }.reverse
  end

  def show
    redirect_to root_path, notice: 'Этот курс еще не одобрен.' unless @course.approved?
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

    respond_to do |format|
      if @course.save
        redirect_to @course, notice: 'Спасибо за предложенный курс!'
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        redirect_to @course, notice: 'Кур был успешно обновлен.'
      else
        render :edit
      end
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :language, :url, :paid)
  end
end
