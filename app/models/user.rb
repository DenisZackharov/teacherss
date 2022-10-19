class User < ApplicationRecord
  extend Enumerize

  ROLES = %i[super_admin teacher head_teacher director].freeze

  # TODO: connect :confirmable when email sender will work
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :teachers, -> { where(role: :teacher) }
  scope :head_teachers, -> { where(role: :head_teacher) }

  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :minimum_working_hours_per_week, :maximum_working_hours_per_week,
            numericality: { greater_than_or_equal_to: 0 }

  enumerize :role, in: ROLES, predicates: true, scope: :shallow
end