class TeacherSpecializationPolicy < ApplicationPolicy
  def index?
    manage_organization_access?
  end
end
