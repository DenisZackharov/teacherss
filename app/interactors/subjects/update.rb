module Subjects
  class Update
    include Interactor::Organizer
    include TransactionalInteractor

    organize OrganizationSubjects::DestroyRecord,
             Subjects::FindOrCreateRecord,
             OrganizationSubjects::PrepareParams,
             OrganizationSubjects::SaveRecord
  end
end
