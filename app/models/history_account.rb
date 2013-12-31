class HistoryAccount < ActiveRecord::Base
  attr_accessible :account_id, :amount
  has_one :account
end
