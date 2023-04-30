module OrganizationSubjects
  class FindRecord
    include Interactor

    delegate :subject, :organization, to: :context

    def call
      context.fail!(error_data: error_data) unless organization_subject

      context.organization_subject = organization_subject
    end

    private

    def organization_subject
      OrganizationSubject.find_by(subject: subject, organization: organization)
    end

    def error_data
      {
        message: I18n.t(
          "errors.messages.record_not_found",
          model: I18n.t("activerecord.models.organization_subject")
        )
      }
    end
  end
end
