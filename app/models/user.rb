class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
include Rails.application.routes.url_helpers
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me , :role_id
  # attr_accessible :title, :body
  has_many :projects
  has_many :transactions
  belongs_to :role
  

  after_save do |u|
   Autocomplete.create term: u.email , path:user_show_path(u.id)

  end

end
