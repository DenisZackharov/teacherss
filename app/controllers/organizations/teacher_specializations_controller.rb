module Organizations
  class TeacherSpecializationsController < ApplicationController
    before_action :authorize!

    expose :subjects, from: :organization
    expose :field_of_studies, from: :organization
    expose :organization, id: -> { params[:organization_id] }
    expose :teacher_specializations, -> { teacher_specializations }
    expose :teachers, -> { teachers_names_with_ids }
    expose :paginate, -> { paginating.first }
    expose :search, -> { search }

    private

    def teacher_specializations
      TeacherSpecializationDecorator.decorate_collection(paginating.second)
    end

    def teachers_names_with_ids
      UserDecorator.decorate_collection(teachers_and_head_teachers).map do |teacher|
        [teacher.last_name_with_initials, teacher.id]
      end
    end

    def teachers_and_head_teachers
      @teachers_and_head_teachers ||= organization.users.teachers_and_head_teachers
    end

    def paginating
      @paginating ||= pagy(search.result)
    end

    def search
      @search ||= raw_relation.ransack(params[:q])
    end

    def raw_relation
      TeacherSpecialization.where(user: teachers_and_head_teachers).includes(:user, :subject, :field_of_study)
    end
  end
end
