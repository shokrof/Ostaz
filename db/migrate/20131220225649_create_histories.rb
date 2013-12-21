class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :amount
      t.datetime :date
      t.integer :account_id

      t.timestamps
    end
  end
end
