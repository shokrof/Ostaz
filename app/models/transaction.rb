class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :account_type_id, :amount, :date, :note, :transaction_id, :user_id
end
