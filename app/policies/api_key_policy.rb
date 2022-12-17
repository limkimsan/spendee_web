class ApiKeyPolicy < ApplicationPolicy
  def index?
    user.primary_admin?
  end

  def show?
    destroy?
  end

  def create?
    user.primary_admin?
  end

  def update
    create?
  end

  def archive?
    create?
  end

  def restore?
    record.deleted?
  end

  def destroy?
    archive?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end