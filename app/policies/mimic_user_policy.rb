class MimicUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope if user.admin?
    end
  end

  def index?
    authorized?
  end

  private

  def authorized?
    user.admin?
  end
end
