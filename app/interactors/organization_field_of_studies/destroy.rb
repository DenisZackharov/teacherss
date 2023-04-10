module OrganizationFieldOfStudies
  class Destroy
    include Interactor

    delegate :field_of_study, :organization, to: :context

    def call
      organization_field_of_study.destroy
    end

    private

    def organization_field_of_study
      OrganizationFieldOfStudy.find_by!(field_of_study: field_of_study, organization: organization)
    end
  end
end
