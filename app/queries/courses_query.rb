# frozen_string_literal: true

class CoursesQuery
  attr_reader :query, :params

  def initialize(initial_query = Course.all, params = {})
    @query = initial_query
    @params = params
  end

  def call
    with_comments
    filter_by_language
    filter_by_paid
    filter_by_title
    filter_only_approved
    sort_by_rating
    self
  end

  def filter_by_language
    @query = query.where(language: params[:language]) if params[:language].in?(%w(Русский English))
  end

  def filter_by_paid
    @query = query.where(paid: params[:paid]) if params[:paid].in?(%w(1 0))
  end

  def filter_by_title
    @query = query.where('title ILIKE ?', "%#{params[:title]}%") if params[:title].present?
  end

  def filter_only_approved
    @query = query.approved
  end

  def sort_by_rating
    @query = query.sort_by { |course| [course.rating, course.comments.count] }.reverse
  end

  def with_comments
    @query = query.includes(:comments)
  end
end
