class ResourceSerializer < ActiveModel::Serializer
  attributes :title, :description, :url, :created_at, :updated_at
end
