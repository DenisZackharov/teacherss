module Organizations
  class TeacherSpecializationsController < ApplicationController
    before_action :authorize!

    expose :teacher_specialization
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
      UserDecorator.decorate_collection(teacher_users).map do |teacher|
        [teacher.last_name_with_initials, teacher.id]
      end
    end

    def teacher_users
      @teacher_users ||= organization.users.teachers_and_head_teachers
    end

    def paginating
      @paginating ||= pagy(search.result)
    end

    def search
      @search ||= raw_relation.ransack(params[:q])
    end

    def raw_relation
      TeacherSpecialization.where(user: teacher_users).includes(:user, :subject, :field_of_study)
    end
  end
end
