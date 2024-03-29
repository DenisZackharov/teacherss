module FieldOfStudies
  class Update
    include Interactor::Organizer
    include TransactionalInteractor

    organize OrganizationFieldOfStudies::FindRecord,
             OrganizationFieldOfStudies::DestroyRecord,
             FieldOfStudies::FindOrCreateRecord,
             OrganizationFieldOfStudies::PrepareParams,
             OrganizationFieldOfStudies::SaveRecord
  end
end
