class ResourceSerializer < ActiveModel::Serializer
  attributes :title, :description, :url, :user, :resource_category, :created_at, :updated_at, :links

  def user
    object.user.username
  end

  def links
    {
      user: api_user_url(object.user)
    }
  end
end
