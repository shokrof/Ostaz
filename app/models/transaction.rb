class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :amount, :note, :transaction_id, :user_id
  belongs_to :account
  belongs_to :user
  has_one :double_entry ,class_name: "Transaction" ,foreign_key: "transaction_id"
end
