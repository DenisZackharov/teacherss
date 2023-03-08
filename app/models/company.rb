class Company < ApplicationRecord
  extend Enumerize

  COMPANY_TYPES = %w[school university colleague institute other].freeze

  has_many :users, dependent: :destroy

  validates :name, :kind, presence: true
  validates :subdomain, presence: true, uniqueness: true

  enumerize :kind, in: COMPANY_TYPES, predicates: true, scope: :shallow, default: :school
end
