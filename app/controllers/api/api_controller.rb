class Api::ApiController < ApplicationController

  respond_to :json, :xml

  before_filter :restrict_access

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

  def default_serializer_options
    { root: false }
  end

end
