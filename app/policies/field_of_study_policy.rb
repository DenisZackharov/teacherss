class FieldOfStudyPolicy < ApplicationPolicy
  alias_rule :update?, :destroy?, to: :create?

  def create?
    manage_organization_access?
  end
end
