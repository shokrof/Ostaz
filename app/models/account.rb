class Account < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :account_type_id, :amount, :name, :project_id
  belongs_to :account_type
  belongs_to :project
  has_many :histories
  has_many :transactions_credit , class_name: "Transaction" ,foreign_key: "account_id_credit"
  has_many :transactions_debit , class_name: "Transaction" ,foreign_key: "account_id_debit"
  before_save do |acc|
        begin
        a=Account.find acc.id
  	History.create({ account_id:a.id , amount:a.amount})
        rescue
        end
  end 
   after_save do |ac|
  Autocomplete.create term: ac.name , path: account_path(ac.id)
end
 def self.valid
	sum=0
	Account.all.each{|account| sum=sum+(account.amount* account.account_type.sign) }
	return sum==0
 end

end
