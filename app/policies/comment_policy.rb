# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

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
    user&.persisted?
  end

  def owner?
    record.user_id == user.id
  end

  def comment?
    user.comments
        .pluck(:course_id)
        .include?(record.course.id)
  end

  def rate?
    user?
  end
end
