class Organization < ApplicationRecord
  extend Enumerize

  ORGANIZATION_TYPES = %w[school university colleague institute other].freeze

  has_many :users, dependent: :destroy
  has_many :organization_subjects, dependent: :destroy
  has_many :subjects, through: :organization_subjects
  has_many :organization_field_of_studies, dependent: :destroy
  has_many :field_of_studies, through: :organization_field_of_studies

  validates :name, :kind, presence: true
  validates :subdomain, presence: true, uniqueness: true

  enumerize :kind, in: ORGANIZATION_TYPES, predicates: true, scope: :shallow, default: :school
end
