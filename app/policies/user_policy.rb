class UserPolicy < ApplicationPolicy
  def index?
    user.primary_admin? || user.admin?
  end

  def show?
    true
  end

  def create?
    user.primary_admin?
  end

  def update?
    current_user = user
  end

  class Scope < Scope
    def resolve
      if user.primary_admin?
        scope.all
      else
        raise Pundit::NotAuthorizedError, 'not allowed to view this action'
      end
    end
  end
end