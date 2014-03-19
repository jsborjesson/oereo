class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :description, :tags, :links, :username

  has_one :resource_category
  has_one :license

  def username
    @object.user.username
  end

  def tags
    @object.tags.pluck(:tag_name)
  end

  def links
    # TODO: Support for url_helpers was removed in AMS 0.9, it seems like they're bringing it back sooon
    [
      {rel:"self", href: "/api/resources/#{@object.id}" },
      {rel:"resources", href: "/api/resources/" }
    ]
  end

end
