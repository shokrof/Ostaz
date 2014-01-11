class AccountType < ActiveRecord::Base
include Rails.application.routes.url_helpers
  attr_accessible :name, :sign , :credit ,:debit
  has_many :accounts
  has_many :role_can_view
  has_many :role_can_edit

  after_save do |acc|
   Autocomplete.create term: acc.name , path:account_type_path(acc.id) 
 end


end
