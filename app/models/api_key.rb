class ApiKey < ActiveRecord::Base

  # must belong to a developer
  belongs_to :developer
  validates_presence_of :developer

  before_create :generate_access_token
  validates_uniqueness_of :access_token

private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex # TODO: unique db constraint
    end while self.class.exists?(access_token: access_token)
  end
end
