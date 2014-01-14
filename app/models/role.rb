class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :users
  has_many :role_can_view
  has_many :role_can_edit

end
