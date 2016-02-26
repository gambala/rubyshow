class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :graduate]

  def index
    @paid_courses = Course.where(paid: true, approved: true)
    @free_courses = Course.where(paid: false, approved: true)
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
        format.html { redirect_to @course, notice: 'Спасибо за предоженный курс!' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Кур был успешно обновлен.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def graduate
    respond_to do |format|
      if current_user.courses.include?(@course)
        format.js do
          Graduate.find_by(user_id: current_user.id, course: @course).destroy
        end
      else
        format.js { Graduate.create(user_id: current_user.id, course: @course ) }
      end
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :language)
  end
end
