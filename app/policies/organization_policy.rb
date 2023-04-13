class OrganizationPolicy < ApplicationPolicy
  def show?
    user.organization.id == record.id
  end
end
