class Account < ActiveRecord::Base
  attr_accessible :account_type_id, :amount, :name, :project_id
  belongs_to :account_type
  belongs_to :project
 def valid
	sum=0
	#Accounts.all.each{|account| sum=sum+(account.)
 end

end
