class CoursePolicy < ApplicationPolicy
  def update?
    admin?
  end

  def show?
    record.approved || admin?
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
    user&.persisted?
  end

  def admin?
    user&.admin?
  end
end
