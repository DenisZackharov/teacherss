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

  validates :name, presence: true, uniqueness: true

  enumerize :name, in: SUBJECT_NAMES
end
