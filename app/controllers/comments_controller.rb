# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i(update destroy)
  before_action :set_course, only: %i(create update destroy)

  def index
    @comments = Comment.includes(:course, :user)
                       .order(created_at: :desc)
                       .paginate(page: params[:page], per_page: 6)
  end

  def create
    @comment = @course.comments.build(comment_params)

    authorize @comment, :create?

    @comment.user_id = current_user.id
    @comment.rating = nil unless @comment.graduate?

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to @course, notice: 'Спасибо за ваш комментарий!'
        end
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to :back, notice: @comment.errors.full_messages }
        format.json { render json: @comment.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @comment, :update?

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Комментарий успешно обновлен.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @comment, :destroy?

    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Комментарий успешно удален.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :rating, :graduate, :kind)
  end
end
