object @resource
attributes :title, :description, :url, :created_at, :updated_at
has_one :user

node :links do |resource|
  [
    { rel: 'self', href: api_resource_path(resource) },
    { rel: 'resources', href: api_resources_path }
  ]
end
