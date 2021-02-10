# frozen_string_literal: true

module Web
  class WelcomeController < Web::ApplicationController
    helper_method :reviews_size, :courses_size,
                  :random_comment, :random_course,
                  :top_5_free_courses, :top_5_paid_courses

    def index; end

    private

    def reviews_size
      @reviews_size ||= Comment.reviews.count
    end

    def courses_size
      @courses_size ||= Course.count
    end

    def random_comment
      @random_comment ||= Comment.includes(:user, :course).all.sample
    end

    def random_course
      @random_course ||= Course.all.sample
    end

    def top_5_free_courses
      @top_5_free_courses ||= CoursesQuery.new(Course.free).filter_top_5.courses
    end

    def top_5_paid_courses
      @top_5_paid_courses ||= CoursesQuery.new(Course.paid).filter_top_5.courses
    end
  end
end
