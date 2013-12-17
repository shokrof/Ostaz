class CreateAccountsTypes < ActiveRecord::Migration
  def change
    create_table :accounts_types do |t|
      t.string :name
      t.integer :sign

      t.timestamps
    end
  end
end
