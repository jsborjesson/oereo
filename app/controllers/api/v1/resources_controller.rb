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

    # TODO: support per_page-parameter
    respond_with @resources.page(params[:page]).per(10)
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
    # NOTE: the first_or_create method returns the first one even if tag_name doesnt match
    tag_name.downcase! # FIXME: ugly to do this manually
    Tag.find_by_tag_name(tag_name) || Tag.create(tag_name: tag_name)
  end

  def resource_params
    # TODO: each tag, first_or_create
    # FIXME: Hacking
    {
      title: params[:title],
      description: params[:description],
      url: params[:url],
      user: @user,
      resource_category: ResourceCategory.all.first # TODO: category
    }
  end

end
