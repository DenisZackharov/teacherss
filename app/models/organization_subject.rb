class OrganizationSubject < ApplicationRecord
  belongs_to :organization
  belongs_to :subject

  validates :subject_id, uniqueness: {
    scope: :organization_id, message: I18n.t("errors.messages.unique_for_organization")
  }
end
