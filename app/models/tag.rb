class Tag < ActiveRecord::Base
  has_and_belongs_to_many :resources

  validates_presence_of :tag_name
  validates_uniqueness_of :tag_name

  before_validation :lower_name

  protected

  def lower_name
    unless self.tag_name.nil?
      self.tag_name.downcase!
    end
  end
end
