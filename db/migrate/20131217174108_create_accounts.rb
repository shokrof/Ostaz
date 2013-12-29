class CreateAccounts < ActiveRecord::Migration
  def change
   drop_table :accounts 
   create_table :accounts do |t|
      t.string :name
      t.integer :amount
      t.integer :account_type_id

      t.timestamps
    end
  end
end
