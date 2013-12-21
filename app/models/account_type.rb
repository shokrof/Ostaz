class AccountType < ActiveRecord::Base
  attr_accessible :name, :sign , :credit ,:debit
  has_many :accounts
end
