class Account < ActiveRecord::Base
  attr_accessible :account_type_id, :amount, :name
  has_many :history_amount
  belongs_to :account_type
end
