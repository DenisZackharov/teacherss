class TeacherSpecialization < ApplicationRecord
  extend Enumerize

  POSSIBLE_DEGREES = (1..10).to_a.freeze

  belongs_to :subject
  belongs_to :user
  belongs_to :field_of_study

  validates :degree, presence: true
  validates :user_id, uniqueness: { scope: %i[subject_id field_of_study_id] }

  enumerize :degree, in: POSSIBLE_DEGREES
end
