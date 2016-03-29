module ApplicationHelper
  def alert_class_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def avatar_url(email, size)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def is_graduate?(comment)
    'Выпускник курса' if comment.graduate?
  end

  def star_rating(rating)
    return if rating.blank?

    star_full = content_tag(:i, '', class: 'glyphicon glyphicon-star')
    star_empty = content_tag(:i, '', class: 'glyphicon glyphicon-star-empty')
    stars = star_full * rating.round + star_empty * (5 - rating.round)

    content_tag(:span, stars.html_safe, class: 'block stars')
  end

  def rating_in_gems(rating)
    if rating.present?
      r = ''
      rating.times do
        r += content_tag(:i, '', class: 'fa fa-diamond')
      end
      r.html_safe
    end
  end

  def unapproved_courses
    Course.where(approved: false).count
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end

  def total_comments
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

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
end
