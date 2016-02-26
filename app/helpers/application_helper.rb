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

  def is_graduate?(user, course)
    'Выпускник курса' if user.courses.include?(course)
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
end
