class TeacherSpecializationDecorator < ApplicationDecorator
  delegate :id, :user, :field_of_study, :subject, :degree

  decorates_association :user
end
