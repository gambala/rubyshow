class CommentPolicy < ApplicationPolicy
  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def create?
    user?
  end

  def user?
    user && user.persisted?
  end

  def owner?
    record.user_id == user.id
  end

  def comment?
    user.comments
        .send(record.kind)
        .pluck(:course_id)
        .include?(record.course.id)
  end

  def rate?
    user? && record.opinion?
  end
end
