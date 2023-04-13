module Subjects
  class Create
    include Interactor::Organizer
    include TransactionalInteractor

    organize Subjects::FindOrCreateRecord,
             OrganizationSubjects::PrepareParams,
             OrganizationSubjects::SaveRecord
  end
end
