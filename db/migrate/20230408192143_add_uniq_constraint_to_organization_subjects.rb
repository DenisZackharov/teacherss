class AddUniqConstraintToOrganizationSubjects < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_index :organization_subjects, %i[organization_id subject_id], unique: true, algorithm: :concurrently
  end
end
