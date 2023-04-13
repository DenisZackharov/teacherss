module Subjects
  class Destroy
    include Interactor::Organizer
    include TransactionalInteractor

    organize OrganizationSubjects::DestroyRecord
  end
end
