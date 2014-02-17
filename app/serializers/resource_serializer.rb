class ResourceSerializer < ActiveModel::Serializer
  attributes :title, :url, :description, :links, :tags

  has_one :license

  def tags
    @object.tags.pluck(:tag_name)
  end

  def links
    # FIXME: Bug in the fork of AMS prevents access to url-methods
    [
      {rel:"self", href: "/api/resources/#{@object.id}" },
      {rel:"resources", href: "/api/resources/" }
    ]
  end

end
