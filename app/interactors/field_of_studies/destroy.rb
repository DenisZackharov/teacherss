module FieldOfStudies
  class Destroy
    include Interactor::Organizer
    include TransactionalInteractor

    organize OrganizationFieldOfStudies::DestroyRecord
  end
end
