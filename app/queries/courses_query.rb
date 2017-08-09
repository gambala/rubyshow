# frozen_string_literal: true

class CoursesQuery
  attr_reader :courses, :params

  def initialize(courses = Course.all, params = {})
    @courses = courses
    @params = params.to_h
  end

  def apply_all_filters
    with_comments
    filter_by_language
    filter_by_paid
    filter_by_title
    filter_only_approved
    sort_by_rating
    self
  end

  def filter_by_language
    @courses = courses.where(language: params[:language]) if params[:language].in?(%w(Русский English))
    self
  end

  def filter_by_paid
    @courses = courses.where(paid: params[:paid]) if params[:paid].in?(%w(1 0))
    self
  end

  def filter_by_title
    @courses = courses.where('title ILIKE ?', "%#{params[:title]}%") if params[:title].present?
    self
  end

  def filter_only_approved
    @courses = courses.approved
    self
  end

  def filter_top_5
    with_comments
    filter_only_approved
    sort_by_rating
    first_5
    self
  end

  def first_5
    @courses = courses.first(5)
    self
  end

  def sort_by_rating
    @courses = courses.sort_by { |course| [course.rating, course.comments.count] }.reverse
    self
  end

  def with_comments
    @courses = courses.includes(:comments)
    self
  end
end
