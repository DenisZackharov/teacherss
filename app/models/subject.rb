class Subject < ApplicationRecord
  extend Enumerize

  SUBJECT_NAMES = [
    "Math",
    "History",
    "English Language",
    "Russian Language",
    "Physics",
    "Chemistry",
    "Biology",
    "Informatics",
    "Geography",
    "Litrature",
    "Social Science",
    "Physical Education"
  ].freeze

  has_many :company_subjects, dependent: :destroy
  has_many :companies, through: :company_subjects

  validates :name, presence: true, uniqueness: true

  enumerize :name, in: SUBJECT_NAMES
end
