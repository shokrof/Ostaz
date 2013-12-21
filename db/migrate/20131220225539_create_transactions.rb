class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.integer :amount
      t.integer :account_type_id
      t.integer :user_id
      t.datetime :date
      t.string :note
      t.integer :transaction_id

      t.timestamps
    end
  end
end
