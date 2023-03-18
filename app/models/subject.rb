class Subject < ApplicationRecord
  has_many :organization_subjects, dependent: :destroy
  has_many :organizations, through: :organization_subjects

  validates :name, presence: true, uniqueness: true
end
