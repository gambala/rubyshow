# frozen_string_literal: true

class ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end

    def admin?
      user.admin?
    end

    def authorized(some_scope)
      Pundit.policy_scope(user, some_scope)
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def new?
    create?
  end

  def create?
    false
  end

  def show?
    false
  end

  def edit?
    update?
  end

  def update?
    false
  end

  def delete?
    destroy?
  end

  def destroy?
    false
  end

  def destroy_all?
    false
  end

  def undelete?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  private

  def admin?
    user.admin?
  end

  def authorized(some_scope)
    Pundit.policy_scope(user, some_scope)
  end

  def record_in_scope?
    scope.where(id: record.id).exists?
  end
end
