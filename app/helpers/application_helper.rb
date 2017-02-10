module ApplicationHelper
  def alert_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def avatar_url(email, size)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def rating_in_gems(rating)
    return if rating.blank?
    diamond = content_tag(:i, '', class: 'fa fa-diamond')
    diamonds = diamond * rating.round
    diamonds.html_safe
  end

  def unapproved_courses_amount
    Course.where(approved: false).count
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
end
