class Developer < ActiveRecord::Base
  # password
  has_secure_password
  validates_presence_of :password, on: :create
  validates_length_of :password, minimum: 5

  # email
  validates :email, presence: true, uniqueness: true, email: true

  # api_key
  has_one :api_key
  validates_presence_of :api_key

  before_validation :renew_access_token, on: :create
  def renew_access_token
    self.api_key.destroy if self.api_key.present?
    self.create_api_key
  end

  def access_token
    self.api_key.access_token
  end

  def to_s
    return self.email
  end
end
