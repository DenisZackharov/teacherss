module Subjects
  class Destroy
    include Interactor::Organizer
    include TransactionalInteractor

    organize OrganizationSubjects::FindRecord,
             OrganizationSubjects::DestroyRecord
  end
end
