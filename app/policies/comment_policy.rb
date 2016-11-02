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
end
