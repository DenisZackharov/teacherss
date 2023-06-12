module Organizations
  class TeacherSpecializationsController < ApplicationController
    include FlashPreparer

    expose :teacher_specialization
    expose :subjects, from: :organization
    expose :field_of_studies, from: :organization
    expose :organization, id: -> { params[:organization_id] }
    expose :teacher_specializations, -> { teacher_specializations }
    expose :teachers, -> { UserDecorator.decorate_collection(teacher_users).map(&:value_with_id) }
    expose :paginate, -> { paginating.first }
    expose :search, -> { search }

    private

    def teacher_specializations
      TeacherSpecializationDecorator.decorate_collection(paginating.second)
    end

    def teacher_users
      @teacher_users ||= organization.users.teachers
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
