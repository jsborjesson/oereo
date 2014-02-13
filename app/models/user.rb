class User < ActiveRecord::Base

  # username
  validates :username, presence: true, length: { minimum: 4, maximum: 20 }
  validates_uniqueness_of :username

  # password
  has_secure_password
  validates_presence_of :password, on: :create
  validates_length_of :password, minimum: 5

  # email
  validates :email, presence: true, uniqueness: true
  validates_formatting_of :email

  def to_s
    return self.email
  end

end
