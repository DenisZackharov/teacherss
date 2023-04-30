module OrganizationFieldOfStudies
  class PrepareParams
    include Interactor

    delegate :field_of_study, :organization, to: :context

    def call
      context.organization_field_of_study_params = organization_field_of_study_params
    end

    private

    def organization_field_of_study_params
      {
        field_of_study: field_of_study,
        organization: organization
      }
    end
  end
end
