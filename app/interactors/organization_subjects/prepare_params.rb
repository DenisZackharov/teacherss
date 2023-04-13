module OrganizationSubjects
  class PrepareParams
    include Interactor

    delegate :subject, :organization, to: :context

    def call
      context.organization_subject_params = organization_subject_params
    end

    private

    def organization_subject_params
      {
        subject: subject,
        organization: organization
      }
    end
  end
end
