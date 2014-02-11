class Resource < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user

  # Prefixes http:// if not present
  def self.format_url(url)
    if url.to_s !~ url_regexp && "http://#{url}" =~ url_regexp
      "http://#{url}"
    else
      url
    end
  end

  # Matches a url, stolen from railscasts #301
  def self.url_regexp
    /\Ahttps?:\/\/([^\s:@]+:[^\s:@]*@)?[-[[:alnum:]]]+(\.[-[[:alnum:]]]+)+\.?(:\d{1,5})?([\/?]\S*)?\z/iux
  end

  before_validation do
    self.url = self.class.format_url(url)
  end

  validates_presence_of :url
  validates_format_of :url, with: url_regexp

  validates :title, presence: true, length: { maximum: 140 }
end
