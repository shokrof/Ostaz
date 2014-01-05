class CreateHistoryAccounts < ActiveRecord::Migration
  def change
  drop_table :history_accounts  
  create_table :history_accounts do |t|
      t.integer :amount
      t.integer :account_id

      t.timestamps
    end
  end
end
