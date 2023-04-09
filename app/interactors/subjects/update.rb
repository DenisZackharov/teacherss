module Subjects
  class Update
    include Interactor::Organizer
    include TransactionalInteractor

    organize OrganizationSubjects::Destroy,
             Subjects::FindOrCreateRecord,
             OrganizationSubjects::PrepareParams,
             OrganizationSubjects::SaveRecord
  end
end
