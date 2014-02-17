class Api::V1::ResourcesController < Api::ApiController

  def index
    # TODO: pagination
    # TODO: support multiple tags
    if params[:tagged]
      resources = Resource.includes(:tags).where('tags.tag_name' => params[:tagged])
    else
      resources = Resource.all
    end
    respond_with resources.page(params[:page]).per(2)
  end

  def show
    respond_with Resource.find(params[:id])
  end

  def create
    # FIXME: Should :api really be needed? This took way to long to figure out
    respond_with :api, Resource.create(resource_params)
  end

  def update
    respond_with Resource.update(params[:id], params[:resource])
  end

  def destroy
    respond_with Resource.destroy(params[:id])
  end

private

  def resource_params
    # TODO: each tag, first_or_create
    # FIXME: Hacking
    {
      title: params[:title],
      description: params[:description],
      url: params[:url],
      user: User.all.first, # TODO: current user
      resource_category: ResourceCategory.all.first
    }
  end

end
