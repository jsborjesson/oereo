object @resource
attributes :title, :description, :url, :created_at, :updated_at

child :user do
  attributes :username
end

child :tags do
  attributes :tag_name
end

node :links do |resource|
  [
    { rel: 'self', href: api_resource_path(resource) },
    { rel: 'resources', href: api_resources_path }
  ]
end
