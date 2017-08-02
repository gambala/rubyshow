# frozen_string_literal: true

class CoursesQuery < ApplicationQuery
  action :with_comments,
         :filter_by_language,
         :filter_by_paid,
         :filter_by_title,
         :filter_only_approved,
         :sort_by_rating

  def filter_by_language
    return unless options[:language].in?(%w(Русский English))
    where(language: options[:language])
  end

  def filter_by_paid
    return unless options[:paid].in?(%w(1 0))
    where(paid: options[:paid])
  end

  def filter_by_title
    return unless options[:title].present?
    where('title ILIKE ?', "%#{options[:title]}%")
  end

  def filter_only_approved
    approved
  end

  def sort_by_rating
    sort_by do |course|
      [course.rating, course.comments.count]
    end.reverse
  end

  def with_comments
    includes(:comments)
  end
end
