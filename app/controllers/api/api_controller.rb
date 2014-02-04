class Api::ApiController < ApplicationController

  respond_to :json, :xml

  before_filter :restrict_access

  protected

  def restrict_access
    # TODO: support providing Authorization header
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end

  def default_serializer_options
    { root: false }
  end

end
