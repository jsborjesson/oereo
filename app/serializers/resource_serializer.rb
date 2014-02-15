class ResourceSerializer < ActiveModel::Serializer
  attributes :title, :url, :description, :links

  has_many :tags

  def links
    # FIXME: bug in xml ams
    [
      {rel:"self", href: api_resource_url(object) },
      {rel:"resources", href: api_resources_url }
    ]
  end

end
