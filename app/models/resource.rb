class Resource < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user

  validates :url, presence: true
  validates_formatting_of :url

  validates :title, presence: true, length: { maximum: 140 }

end
