class Organization < ApplicationRecord
  extend Enumerize

  ORGANIZATION_TYPES = %w[school university colleague institute other].freeze

  has_many :users, dependent: :destroy

  validates :name, :kind, presence: true
  validates :subdomain, presence: true, uniqueness: true

  enumerize :kind, in: ORGANIZATION_TYPES, predicates: true, scope: :shallow, default: :school
end
