class Role < ActiveRecord::Base
include Rails.application.routes.url_helpers
  attr_accessible :name
  has_many :users
  has_many :role_can_view
  has_many :role_can_edit
  after_save do |r|
   Autocomplete.create term: r.name , path: role_path(r.id)
  end

end
