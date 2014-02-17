class Api::ApiController < ApplicationController

  respond_to :json, :xml

  # turn off csrf for api-calls
  skip_before_filter :verify_authenticity_token

  before_filter :authorize_token!

  # TODO: move this to individual controllers?
  before_filter :authorize_user!, except: [:index, :show]

  # provide a nicer response at the root /api/
  def index
    respond_with resources: api_resources_url, tags: api_tags_url
  end

protected

  def authorize_token!
    token = request.headers['X-AUTH-TOKEN']
    unless ApiKey.exists?(access_token: token)
      render :text => "Invalid access token", :status => :unauthorized
    end
  end

  def authorize_user!
    authenticate_or_request_with_http_basic do |username, password|
      # FIXME: this is sending 500 instead of 401
      @user = User.find_by_username(username)
      @user.authenticate(password)
    end
  end

end
