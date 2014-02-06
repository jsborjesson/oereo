class User < ActiveRecord::Base

  # api_key
  has_one :api_key

  # password
  has_secure_password
  validates_presence_of :password, on: :create

  # email
  validates_presence_of :email
  validates_uniqueness_of :email

  def access_token
    self.api_key.access_token
  end
end
