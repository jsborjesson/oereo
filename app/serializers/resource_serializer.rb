class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :url, :created_at, :updated_at
end
