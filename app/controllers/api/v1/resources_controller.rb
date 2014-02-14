class Api::V1::ResourcesController < Api::ApiController

  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def create
    @resource = Resource.create(params[:resource])
  end

  def update
    @resource = Resource.update(params[:id], params[:resource])
  end

  def destroy
    @resource = Resource.destroy(params[:id])
  end

end
