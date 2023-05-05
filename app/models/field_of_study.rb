class FieldOfStudy < ApplicationRecord
  has_many :organization_field_of_studies, dependent: :destroy
  has_many :organizations, through: :organization_field_of_studies
  has_many :teacher_specializations, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
