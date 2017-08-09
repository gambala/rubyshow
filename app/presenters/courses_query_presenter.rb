# frozen_string_literal: true

class CoursesQueryPresenter < ApplicationPresenter
  presents :query

  def any_titles?
    query.params.any?
  end

  def request_title
    @request_title ||=
      "#{paid_option_title} #{language_option_title}#{title_option_title}"
  end

  def response_title
    @response_title ||=
      "#{courses_amount} #{comments_amount} #{courses_suffix_for_comments}"
  end

  private

  def courses_amount
    "#{query.query.size} #{I18n.t('words.course', count: query.query.size)}"
  end

  def comments_amount
    course_ids = query.query.map { |item| item[:id] }
    comments_size = Comment.where(course_id: course_ids).size
    "и #{comments_size} #{I18n.t('words.comment', count: comments_size)}"
  end

  def courses_suffix_for_comments
    I18n.t('words.courses_suffix', count: query.query.size)
  end

  def paid_option_title
    case query.params[:paid]
    when '1'
      'Платные курсы'
    when '0'
      'Бесплатные курсы'
    when 'all'
      'Платные и бесплатные курсы'
    else
      'Курсы'
    end
  end

  def language_option_title
    case query.params[:language]
    when 'Русский'
      'на русском'
    when 'English'
      'на английском'
    when 'all'
      'на всех языках'
    else
      ''
    end
  end

  def title_option_title
    if query.params[:title].present?
      ", созвучные с «#{query.params[:title]}»"
    else
      ''
    end
  end
end
