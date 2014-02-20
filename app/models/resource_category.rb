class ResourceCategory < ActiveRecord::Base
  has_many :resources
  validates :category, presence: true, uniqueness: true
end
