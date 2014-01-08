class RoleCanEdit < ActiveRecord::Base
  attr_accessible :account_type_id, :role_id
  belongs_to :role
  belongs_to :account_type
end
