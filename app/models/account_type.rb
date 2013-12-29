class AccountType < ActiveRecord::Base
  attr_accessible :name, :sign
  has_many :accounts
end
