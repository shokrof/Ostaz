class EditTransactionTable < ActiveRecord::Migration
  def up
  	remove_column :transactions , :account_type_id
	remove_column :transactions , :date
  end

  def down
	add_column :transactions , :account_type_id
	add_column :transactions , :date
  end
end
