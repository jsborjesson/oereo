class ResourceSerializer < ActiveModel::Serializer
  attributes :title, :url, :description, :links, :tags

  has_many :tags

  def links
    # FIXME: Bug in the fork of AMS prevents access to url-methods
    [
      {rel:"self", href: "/api/resources/#{@object.id}" },
      {rel:"resources", href: "/api/resources/" }
    ]
  end

end
