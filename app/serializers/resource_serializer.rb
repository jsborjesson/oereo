class ResourceSerializer < ActiveModel::Serializer
  attributes :title, :description, :url, :resource_category, :user, :created_at, :updated_at
end
