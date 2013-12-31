class EditTransactions < ActiveRecord::Migration
  def up
	remove_column  :transactions ,:transaction_type
        rename_column :transactions ,:account_id ,:account_id_credit
        rename_column :transactions ,:transaction_id ,:account_id_debit
 end

  def down

        add_column  :transactions ,:transaction_type
        rename_column :transactions  ,:account_id_credit,:account_id
        rename_column :transactions , :account_id_debit ,:transaction_id

  end
end
