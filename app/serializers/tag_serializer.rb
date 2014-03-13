class TagSerializer < ActiveModel::Serializer
  attributes :id, :tag_name, :links

  def links
    # FIXME: Dynamic url
    # TODO: use the nicer /api/tags/:tagged url
    [
      {rel:"resources", href: "/api/resources?tag=#{@object.tag_name}" }
    ]
  end
end
