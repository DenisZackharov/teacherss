module OrganizationSubjects
  class Destroy
    include Interactor

    delegate :subject, :organization, to: :context

    def call
      organization_subject.destroy
    end

    private

    def organization_subject
      OrganizationSubject.find_by!(subject: subject, organization: organization)
    end
  end
end
