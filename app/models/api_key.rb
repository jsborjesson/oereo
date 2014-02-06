class ApiKey < ActiveRecord::Base

  # must belong to a user
  belongs_to :user
  validates_presence_of :user

  before_create :generate_access_token

  private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex # TODO: unique db constraint
    end while self.class.exists?(access_token: access_token)
  end
end
