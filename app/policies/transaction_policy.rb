class TransactionPolicy < ApplicationPolicy
  def index?
    current_user = user
  end

  def show
    index?
  end

  def update
    index?
  end

  def destroy?
    index?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end