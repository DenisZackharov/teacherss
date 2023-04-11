class CreateTeacherSpecializations < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    create_table :teacher_specializations do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :field_of_study, null: false, foreign_key: true
      t.integer :degree, null: false

      t.timestamps
    end

    add_index :teacher_specializations,
              %i[subject_id user_id field_of_study_id],
              unique: true,
              algorithm: :concurrently,
              name: :index_on_organization_id_field_of_study_id_user_id
  end
end
