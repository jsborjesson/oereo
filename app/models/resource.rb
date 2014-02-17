class Resource < ActiveRecord::Base
  has_and_belongs_to_many :tags

  belongs_to :user
  validates_presence_of :user

  belongs_to :resource_category
  validates_presence_of :resource_category

  belongs_to :license

  validates :url, presence: true
  validates_formatting_of :url

  validates :title, presence: true, length: { maximum: 140 }

end
