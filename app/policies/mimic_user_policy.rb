class MimicUserPolicy < ApplicationPolicy
  def index?
    authorized?
  end

  class Scope < Scope
    def resolve
      return scope if user.admin?
    end
  end

  private

  def authorized?
    user.admin?
  end
end
