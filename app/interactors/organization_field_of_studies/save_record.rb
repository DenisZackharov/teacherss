module OrganizationFieldOfStudies
  class SaveRecord
    include Interactor
    include ModelNameHelper

    delegate :organization_field_of_study, :organization_field_of_study_params, to: :context

    def call
      context.organization_field_of_study ||= OrganizationFieldOfStudy.new

      raise_error unless organization_field_of_study.update(organization_field_of_study_params)
    end

    private

    def raise_error
      context.fail!(error_data: error_data)
    end

    def error_data
      {
        message: I18n.t("errors.messages.record_invalid", model: model_name(organization_field_of_study)),
        detail: organization_field_of_study.errors.to_a
      }
    end
  end
end
