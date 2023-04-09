class OrganizationFieldOfStudy < ApplicationRecord
  belongs_to :organization
  belongs_to :field_of_study
end
