class AddCompanyTable < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :kind, null: false
      t.string :subdomain, null: false

      t.timestamps null: false
    end

    add_index :companies, :subdomain, unique: true, algorithm: :concurrently
  end
end
