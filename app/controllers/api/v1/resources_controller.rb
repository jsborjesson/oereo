class Api::V1::ResourcesController < Api::ApiController

  # set pagination headers
  after_filter only: [:index] { paginate(:resources) }

  def index
    if params[:tagged]
      # TODO: support multiple tags
      @resources = Tag.find_by_tag_name(params[:tagged]).resources
    else
      @resources = Resource.all
    end

    per_page = params[:per_page] || 10
    respond_with @resources.page(params[:page]).per(per_page)
  end

  def show
    respond_with Resource.find(params[:id])
  end

  def create
    @resource = Resource.create(resource_params)
    apply_tags # TODO: optimize, don't save until tags are in?s

    # FIXME: Should :api really be needed? This took way to long to figure out
    respond_with :api, @resource
  end

  def update
    @resource = Resource.update(params[:id], resource_params)
    @resource.tags.clear # TODO: Updating tags can be done more efficiently
    apply_tags
    respond_with :api, @resource
  end

  def destroy
    respond_with Resource.destroy(params[:id])
  end

private

  def apply_tags
    if params[:tags].respond_to?('each')
      params[:tags].each do |tag_name|
        @resource.tags << get_tag(tag_name)
      end
    end
  end

  def get_tag(tag_name)
    tag_name.downcase! # FIXME: case insensitive search for tags?
    Tag.where(tag_name: tag_name).first_or_create
  end

  def resource_params
    {
      title: params[:title],
      description: params[:description],
      url: params[:url],
      user: @user, # set in api_controller
      license: License.find_by_id(params[:license_id]),
      resource_category: ResourceCategory.find_by_category(params[:resource_category])
    }
  end

end
