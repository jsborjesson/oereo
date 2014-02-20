class Api::V1::TagsController < Api::ApiController

  def index
    # TODO: needs another look
    respond_with Tag.all
  end
end
