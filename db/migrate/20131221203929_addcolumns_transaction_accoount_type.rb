class AddcolumnsTransactionAccoountType < ActiveRecord::Migration
  def up
 	add_column :transactions , :type , :string
	add_column :account_types , :credit , :integer
	add_column :account_types , :debit , :integer
 end

  def down
        remove_column :transactions , :type 
        remove_column :account_types , :credit 
        remove_column :account_types , :debit 
  end
end
