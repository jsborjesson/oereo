class ResourcesController < ApplicationController

  respond_to :json

  def index
    respond_with Resource.all
  end

  def show
    respond_with Resource.find(params[:id])
  end

  def create
    respond_with Resource.create(params[:resource])
  end

  def update
    respond_with Resource.update(params[:id], params[:resource])
  end

  def destroy
    respond_with Resource.destroy(params[:id])
  end
end
