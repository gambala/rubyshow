# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend
  include RailsPlus::Helpers::Dashed
  include RailsPlus::Helpers::RichFormFor
  # include RailsPlus::Helpers::Seo

  def avatar_url(email, size)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "https://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def benchmark(caption = nil, &block)
    Benchmark.benchmark(caption.to_s) do |x|
      x.report do
        yield
      end
    end
  end

  def comments_amount
    Comment.count
  end

  def language_flag(language)
    case language
    when 'English'
      content_tag(:span, '', class: 'flag-icon flag-icon-us', title: language)
    when 'Русский'
      content_tag(:span, '', class: 'flag-icon flag-icon-ru', title: language)
    end
  end

  def course_status(course)
    course.paid? ? 'Платный' : 'Бесплатный'
  end

  def course_comment_count(course)
    course&.comments&.count || 0
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def rescued_csrf_meta_tags
    csrf_meta_tags
  rescue ArgumentError
    request.reset_session
    csrf_meta_tags
  end
end
