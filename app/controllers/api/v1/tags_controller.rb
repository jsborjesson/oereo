class Api::V1::TagsController < Api::ApiController

  def index
    # TODO: needs another look
    respond_with Tag.all
  end

  def show
    respond_with Tag.find(params[:id])
  end
end
