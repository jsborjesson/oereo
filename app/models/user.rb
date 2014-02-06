class User < ActiveRecord::Base


  validates_presence_of :email
  validates_uniqueness_of :email

  has_secure_password
  validates_presence_of :password, on: :create
  # validates_confirmation_of :password

end
