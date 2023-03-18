class CreateOrganizationSubjectTable < ActiveRecord::Migration[7.0]
  def change
    create_table :organization_subjects do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
