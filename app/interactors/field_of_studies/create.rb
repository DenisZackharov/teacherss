module FieldOfStudies
  class Create
    include Interactor::Organizer
    include TransactionalInteractor

    organize FieldOfStudies::FindOrCreateRecord,
             OrganizationFieldOfStudies::PrepareParams,
             OrganizationFieldOfStudies::SaveRecord
  end
end
