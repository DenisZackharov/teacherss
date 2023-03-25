class OrganizationPolicy < ApplicationPolicy
  def show?
    user.organization == record && user.director?
  end
end
