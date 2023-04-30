module OrganizationFieldOfStudies
  class DestroyRecord
    include Interactor

    delegate :organization_field_of_study, to: :context

    def call
      organization_field_of_study.destroy

      context.delete_field(:organization_field_of_study)
    end
  end
end
