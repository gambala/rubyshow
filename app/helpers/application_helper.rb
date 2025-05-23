module ApplicationHelper
  include Pagy::Frontend
  include RailsPlus::Helpers::Benchmark
  include RailsPlus::Helpers::Dashed
  include RailsPlus::Helpers::FrameContainerTag
  include RailsPlus::Helpers::GravatarURL
  include RailsPlus::Helpers::RescuedCsrfMetaTags
  include RailsPlus::Helpers::RichFormFor
  include RailsPlus::Helpers::Seo

  def comments_amount
    Comment.count
  end

  def language_flag(language)
    case language
    when "English"
      content_tag(:span, "", class: "fi fi-us", title: language)
    when "Русский"
      content_tag(:span, "", class: "fi fi-ru", title: language)
    end
  end

  def course_status(course)
    course.paid? ? "Платный" : "Бесплатный"
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
end
