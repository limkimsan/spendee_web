class CategoryPolicy < ApplicationPolicy
  def index?
    user.primary_admin? || user.admin?
  end

  def show?
    index?
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def update?
    index?
  end

  def delete?
    index?
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