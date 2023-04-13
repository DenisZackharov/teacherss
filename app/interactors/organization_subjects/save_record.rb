module OrganizationSubjects
  class SaveRecord
    include Interactor
    include RecordNameConverter

    delegate :organization_subject, :organization_subject_params, to: :context

    def call
      context.organization_subject ||= OrganizationSubject.new

      context.fail!(error_data: error_data) unless organization_subject.update(organization_subject_params)
    end

    private

    def error_data
      {
        message: I18n.t("errors.messages.record_invalid", model: model_name(organization_subject)),
        detail: organization_subject.errors.full_messages
      }
    end
  end
end
