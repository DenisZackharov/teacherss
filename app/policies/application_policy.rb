class ApplicationPolicy < ActionPolicy::Base
  private

  def manage_organization_access?
    User::MANAGE_ORGANIZATION_ROLES.include?(user.role)
  end
end
