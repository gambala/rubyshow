class CoursesFilterTitlingService
  attr_accessor :options
  attr_accessor :courses

  def initialize(options, courses)
    @options = options
    @courses = courses
  end

  def any_titles?
    options.any?
  end

  def query_request_title
    @courses_title ||= "#{paid_param_title} #{language_param_title}#{title_param_title}"
  end

  def query_result_title
    @courses_overview_title ||=
      "#{courses_amount_title}"
  end

  private

  def courses_amount_title
    "#{courses.size} #{I18n.t('words.course', count: courses.size)}"
  end

  def comments_amount_title
    comments_size = 10
    "и #{comments_size} #{I18n.t('words.comment', count: comments_size)}"
  end

  def courses_suffix
    I18n.t('words.courses_suffix', count: courses.size)
  end

  def paid_param_title
    case options[:paid]
    when '1'
      'Платные курсы'
    when '0'
      'Бесплатные курсы'
    else
      'Курсы'
    end
  end

  def language_param_title
    case options[:language]
    when 'Русский'
      'на русском'
    when 'English'
      'на английском'
    else
      ''
    end
  end

  def title_param_title
    @title_param_title ||= if options[:title].present?
                                ", созвучные с «#{options[:title]}»"
                              else
                                ''
                              end
  end
end
