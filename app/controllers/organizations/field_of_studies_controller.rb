module Organizations
  class FieldOfStudiesController < ApplicationController
    include FlashPreparer

    expose :field_of_study
    expose :organization, -> { Organization.find(params[:organization_id]) }
    expose :field_of_studies, -> { organization.field_of_studies.order(updated_at: :desc) }

    before_action :authorize_field_of_study, only: %i[create update destroy]

    def create
      field_of_study = create_field_of_study.field_of_study

      flash_message(create_field_of_study, :create, field_of_study)
    end

    def update
      field_of_study = update_field_of_study.field_of_study

      flash_message(update_field_of_study, :update, field_of_study)
    end

    def destroy
      field_of_study = destroy_field_of_study.field_of_study

      flash_message(destroy_field_of_study, :destroy, field_of_study)
    end

    private

    def create_field_of_study
      @create_field_of_study ||= ::FieldOfStudies::Create.call(
        organization: organization,
        field_of_study_params: field_of_study_params
      )
    end

    def update_field_of_study
      @update_field_of_study ||= ::FieldOfStudies::Update.call(
        field_of_study: field_of_study,
        organization: organization,
        field_of_study_params: field_of_study_params
      )
    end

    def destroy_field_of_study
      @destroy_field_of_study ||= ::FieldOfStudies::Destroy.call(
        field_of_study: field_of_study,
        organization: organization
      )
    end

    def field_of_study_params
      params.require(:field_of_study).permit(:name)
    end

    def authorize_field_of_study
      authorize! field_of_study
    end
  end
end
