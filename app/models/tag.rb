class Tag < ActiveRecord::Base
  has_and_belongs_to_many :resources

  validates_presence_of :name
  validates_uniqueness_of :name

  before_validation :lower_name

  protected

  def lower_name
    unless self.name.nil?
      self.name.downcase!
    end
  end
end
