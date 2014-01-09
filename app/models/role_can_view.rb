class RoleCanView < ActiveRecord::Base
  attr_accessible :account_type_id, :role_id
  belongs_to :account_type
  belongs_to :role
end
