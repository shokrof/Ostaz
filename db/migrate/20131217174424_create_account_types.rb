class CreateAccountTypes < ActiveRecord::Migration
  def change
#drop_table :account_types    
create_table :account_types do |t|
      t.string :name
      t.integer :sign

      t.timestamps
    end
  end
end
