class CreateRoleCanEdits < ActiveRecord::Migration
  def change
    create_table :role_can_edits do |t|
      t.integer :role_id
      t.integer :account_type_id

      t.timestamps
    end
  end
end
