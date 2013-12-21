class Account < ActiveRecord::Base
  attr_accessible :account_type_id, :amount, :name, :project_id
  belongs_to :account_type
  belongs_to :project
  has_many :histories
  has_many :transactions

 def self.valid
	sum=0
	Account.all.each{|account| sum=sum+(account.amount* account.account_type.sign) }
	return sum==0
 end

end
