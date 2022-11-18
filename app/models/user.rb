class User < ApplicationRecord
  extend Enumerize

  MAX_HOURS_PER_WEEK = 35
  ROLES = %i[super_admin teacher head_teacher director].freeze

  # TODO: connect :confirmable when email sender will work
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :teachers, -> { where(role: :teacher) }
  scope :head_teachers, -> { where(role: :head_teacher) }

  validates :first_name, :last_name, :email, presence: true
  validates :minimum_working_hours_per_week, :maximum_working_hours_per_week,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: MAX_HOURS_PER_WEEK }, on: :update
  validates :minimum_working_hours_per_week, comparison: { less_than: :maximum_working_hours_per_week },
                                             if: :maximum_working_hours_per_week
  validates :maximum_working_hours_per_week, comparison: { greater_than: :minimum_working_hours_per_week },
                                             if: :minimum_working_hours_per_week

  enumerize :role, in: ROLES, predicates: true, scope: :shallow, default: :director
end
