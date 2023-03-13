class AddOrganizationTable < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :kind, null: false, default: "school"
      t.string :subdomain, null: false

      t.timestamps null: false
    end

    add_index :organizations, :subdomain, unique: true, algorithm: :concurrently
  end
end
