module OrganizationFieldOfStudies
  class DestroyRecord
    include Interactor

    delegate :organization_field_of_study, to: :context

    def call
      organization_field_of_study.destroy

      context.organization_field_of_study = nil
    end
  end
end
