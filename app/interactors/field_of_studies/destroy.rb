module FieldOfStudies
  class Destroy
    include Interactor::Organizer
    include TransactionalInteractor

    organize OrganizationFieldOfStudies::FindRecord,
             OrganizationFieldOfStudies::DestroyRecord
  end
end
