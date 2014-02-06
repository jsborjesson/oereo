class User < ActiveRecord::Base
  # password
  has_secure_password
  validates_presence_of :password, on: :create

  # email
  validates_presence_of :email
  validates_uniqueness_of :email
end
