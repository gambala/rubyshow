# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @courses_size = Course.count
    @comments_size = Comment.count
    @random_course = Course.all.sample
    @random_comment = Comment.includes(:user, :course).all.sample
    @top_5_free_courses = CoursesQuery.new(Course.free).filter_top_5.courses
    @top_5_paid_courses = CoursesQuery.new(Course.paid).filter_top_5.courses
  end
end
