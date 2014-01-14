class AccountType < ActiveRecord::Base
  attr_accessible :name, :sign , :credit ,:debit
  has_many :accounts
  has_many :role_can_view
  has_many :role_can_edit
end
