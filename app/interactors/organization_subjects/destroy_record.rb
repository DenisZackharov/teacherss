module OrganizationSubjects
  class DestroyRecord
    include Interactor

    delegate :organization_subject, to: :context

    def call
      organization_subject.destroy

      context.delete_field(:organization_subject)
    end
  end
end
