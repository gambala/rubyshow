module ApplicationHelper
  def avatar_url(email, size)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def is_graduate?(user, course)
    'Выпускник курса' if user.courses.include?(course)
  end
end
