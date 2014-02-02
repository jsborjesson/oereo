class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @resource }
    end
  end
end
