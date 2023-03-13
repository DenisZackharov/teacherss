class AddUniqConstraintToUsers < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    remove_index :users, :email
    add_index :users, %i[email organization_id], unique: true, algorithm: :concurrently
  end
end
