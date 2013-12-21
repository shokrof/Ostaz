class Account < ActiveRecord::Base
  attr_accessible :account_type_id, :amount, :name, :project_id
end
