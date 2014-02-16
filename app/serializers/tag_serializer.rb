class TagSerializer < ActiveModel::Serializer
  attributes :tag_name, :links

  def links
    # FIXME: Dynamic url
    [
      {rel:"resources", href: "/api/resources?tag=#{@object.tag_name}" }
    ]
  end
end
