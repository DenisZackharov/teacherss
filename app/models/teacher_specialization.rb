class TeacherSpecialization < ApplicationRecord
  extend Pagy::Searchkick

  searchkick filterable: %i[user_id subject field_of_study degree]

  belongs_to :subject
  belongs_to :user
  belongs_to :field_of_study

  validates :user_id, uniqueness: { scope: %i[subject_id field_of_study_id] }

  validates :degree, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  def search_data
    {
      user_id: user_id,
      subject_id: subject_id,
      field_of_study_id: field_of_study_id,
      degree: degree
    }
  end
end
