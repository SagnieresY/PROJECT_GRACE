class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user.foundation
  end

  def create?
    user.foundation
  end

  def edit?
    user.foundation
  end

  def update?
    user.foundation
  end
end
