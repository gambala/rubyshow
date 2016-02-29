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

  def approve_block(user, course)
    if user.present? && user.role == 'admin' && !course.approved?
      content_tag(:div, '', class: 'well') do
        link_to 'Одобрить курс', approve_course_path(course),
          method: :put, class: 'text-danger'
      end
    end
  end

  def total_comments
    Comment.count
  end
end
