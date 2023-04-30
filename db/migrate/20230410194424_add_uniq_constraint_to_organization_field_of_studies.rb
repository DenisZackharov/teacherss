class AddUniqConstraintToOrganizationFieldOfStudies < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_index :organization_field_of_studies,
              %i[organization_id field_of_study_id],
              unique: true,
              algorithm: :concurrently,
              name: :index_on_organization_id_and_field_of_study_id
  end
end
