class ResourceSerializer < ActiveModel::Serializer
  attributes :title, :url, :description, :links

  has_many :tags

  def links
    # FIXME: Bug in the fork of AMS prevents access to url-methods
    [
      {rel:"self", href: "..." },
      {rel:"resources", href: "..." }
    ]
  end

end
