class User < ApplicationRecord
  extend Enumerize

  MAX_HOURS_PER_WEEK = 35
  ROLES = %w[super_admin teacher head_teacher director].freeze
  EMPLOYEES_WITH_HOURS = %w[teacher head_teacher].freeze
  MANAGE_ORGANIZATION_ROLES = %w[director head_teacher].freeze

  # TODO: connect :confirmable when email sender will work
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :organization, optional: true

  has_many :teacher_specializations, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: { scope: :organization }
  validates :minimum_working_hours_per_week, :maximum_working_hours_per_week,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: MAX_HOURS_PER_WEEK },
            if: :employees_with_hours?
  validates :minimum_working_hours_per_week, comparison: { less_than: :maximum_working_hours_per_week },
                                             if: :maximum_working_hours_per_week
  validates :maximum_working_hours_per_week, comparison: { greater_than: :minimum_working_hours_per_week },
                                             if: :minimum_working_hours_per_week

  enumerize :role, in: ROLES, predicates: true, scope: :shallow, default: :director

  scope :teachers, -> { where(role: :teacher) }
  scope :head_teachers, -> { where(role: :head_teacher) }
  scope :teachers_and_head_teachers, -> { teachers.or(head_teachers) }

  def employees_with_hours?
    EMPLOYEES_WITH_HOURS.include?(role)
  end
end
