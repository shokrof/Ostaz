class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :amount
      t.integer :account_type_id
      t.integer :project_id

      t.timestamps
    end
  end
end
