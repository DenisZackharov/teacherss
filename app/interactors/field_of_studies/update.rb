module FieldOfStudies
  class Update
    include Interactor::Organizer
    include TransactionalInteractor

    organize OrganizationFieldOfStudies::Destroy,
             FieldOfStudies::FindOrCreateRecord,
             OrganizationFieldOfStudies::PrepareParams,
             OrganizationFieldOfStudies::SaveRecord
  end
end
