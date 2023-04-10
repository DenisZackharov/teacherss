class OrganizationFieldOfStudy < ApplicationRecord
  belongs_to :organization
  belongs_to :field_of_study

  validates :field_of_study_id, uniqueness: {
    scope: :organization_id, message: I18n.t("errors.messages.unique_for_organization")
  }
end
