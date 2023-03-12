class CompanyPolicy < ApplicationPolicy
  def show?
    user.company == record && user.director?
  end
end
