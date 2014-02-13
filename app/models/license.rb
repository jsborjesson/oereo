class License < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_formatting_of :agreement_url, using: :url
end
