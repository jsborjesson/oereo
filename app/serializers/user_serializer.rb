class UserSerializer < ActiveModel::Serializer
  attributes :username, :links

  def links
    # FIXME: replace with url helpers when AMS is fixed
    [
      {rel: "self", href: "/api/users/#{@object.id}" },
      {rel: "resources", href: "/api/resources/" } # FIXME: users resources url
    ]
  end
end
