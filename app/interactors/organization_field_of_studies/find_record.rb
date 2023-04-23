module OrganizationFieldOfStudies
  class FindRecord
    include Interactor

    delegate :field_of_study, :organization, to: :context

    def call
      context.fail!(error_data: error_data) unless organization_field_of_study

      context.organization_field_of_study = organization_field_of_study
    end

    private

    def organization_field_of_study
      OrganizationFieldOfStudy.find_by(field_of_study: field_of_study, organization: organization)
    end

    def error_data
      {
        message: I18n.t(
          "errors.messages.record_not_found",
          model: I18n.t("activerecord.models.organization_field_of_study")
        )
      }
    end
  end
end
