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

  def top_three(index)
    r = case index
        when 1
          content_tag(:i, '', class: 'fa fa-trophy fa-3x')
        when 2
          content_tag(:i, '', class: 'fa fa-trophy fa-2x')
        when 3
          content_tag(:i, '', class: 'fa fa-trophy fa-lg')
        else
          index
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

  def course_status(course)
    course.paid? ? 'Платный' : 'Бесплатный'
  end
end
