class CoursesQueryPresenter < BasePresenter
  presents :queried_courses

  def any_titles?
    queried_courses.options.any?
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
    "#{queried_courses.size} #{I18n.t('words.course', count: queried_courses.size)}"
  end

  def comments_amount
    course_ids = queried_courses.map { |item| item[:id] }
    comments_size = Comment.where(course_id: course_ids).size
    "и #{comments_size} #{I18n.t('words.comment', count: comments_size)}"
  end

  def courses_suffix_for_comments
    I18n.t('words.courses_suffix', count: queried_courses.size)
  end

  def paid_option_title
    case queried_courses.options[:paid]
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
    case queried_courses.options[:language]
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
    if queried_courses.options[:title].present?
      ", созвучные с «#{queried_courses.options[:title]}»"
    else
      ''
    end
  end
end
