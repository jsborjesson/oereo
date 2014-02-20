class Api::V1::ResourceCategoriesController < Api::ApiController
  def index
    respond_with ResourceCategory.all
  end

  def show
    respond_with ResourceCategory.find(params[:id])
  end
end
