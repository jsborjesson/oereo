class User < ActiveRecord::Base


  # password
  has_secure_password
  validates_presence_of :password, on: :create
  validates_length_of :password, minimum: 5

  # email
  validates_presence_of :email
  validates_uniqueness_of :email

  def to_s
    return self.email
  end

end
