module Organizations
  class TeacherSpecializationsController < ApplicationController
    include FlashPreparer

    expose :teacher_specialization
    expose :organization, id: -> { params[:organization_id] }
    expose :teacher_specializations, -> { teacher_specializations }
    expose :subjects, -> { organization.subjects }
    expose :teachers, -> { organization.users.teachers.pluck(:id, :first_name) }
    expose :field_of_studies, -> { organization.field_of_studies }

    private

    def teacher_specializations
      TeacherSpecialization.search(where: { user_id: organization.users.teachers.pluck(:id) }.merge(search_params))
    end

    def search_params
      return {} if params[:search].blank?

      params.permit(search: %i[user_id subject_id field_of_study_id degree])[:search]
        &.select { |_, v| v.present? }.to_h
    end
  end
end
