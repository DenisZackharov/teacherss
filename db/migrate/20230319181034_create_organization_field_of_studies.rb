class CreateOrganizationFieldOfStudies < ActiveRecord::Migration[7.0]
  def change
    create_table :organization_field_of_studies do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :field_of_study, null: false, foreign_key: true

      t.timestamps
    end
  end
end
