module OrganizationSubjects
  class DestroyRecord
    include Interactor

    delegate :organization_subject, to: :context

    def call
      organization_subject.destroy

      context.organization_subject = nil
    end
  end
end
