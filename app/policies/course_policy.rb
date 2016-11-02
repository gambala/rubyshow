class CoursePolicy < ApplicationPolicy
  def update?
    admin?
  end

  def show?
    record.approved
  end

  def edit?
    update?
  end

  def approve?
    admin? && !record.approved
  end

  def destroy?
    admin?
  end

  def create?
    user && user.persisted?
  end

  def admin?
    user && user.admin?
  end
end
