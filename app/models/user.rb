class User < ActiveRecord::Base


  # password
  has_secure_password
  validates_presence_of :password, on: :create

  # email
  validates_presence_of :email
  validates_uniqueness_of :email


  # api_key
  has_one :api_key

  def renew_access_token
    self.api_key.destroy if self.api_key.exists?
    self.create_api_key
  end

  def access_token
    self.api_key.access_token
  end

end
