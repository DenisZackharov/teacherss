class UserPolicy < ApplicationPolicy
  def index?
    manage_organization_access?
  end
end
