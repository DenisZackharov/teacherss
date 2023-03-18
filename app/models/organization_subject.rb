class OrganizationSubject < ApplicationRecord
  belongs_to :organization
  belongs_to :subject
end
