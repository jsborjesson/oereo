class Api::ApiController < ApplicationController

  respond_to :json, :xml

  # turn off csrf for api-calls
  skip_before_filter :verify_authenticity_token

  before_filter :authorize_token!

  # TODO: move this to individual controllers?
  before_filter :authorize_user!, except: [:index, :show]

  # provide a nicer response at the root /api/
  def index
    respond_with resources: api_resources_url,
                 tags: api_tags_url,
                 licenses: api_licenses_url,
                 resource_categories: api_resource_categories_url
  end

protected

  def authorize_token!
    token = request.headers['X-AUTH-TOKEN']
    unless ApiKey.exists?(access_token: token)
      render :text => "Invalid access token", :status => :unauthorized
    end
  end

  def authorize_user!
    begin
      authenticate_or_request_with_http_basic do |username, password|
        # TODO: should I really rely on the instance variable?
        @user = User.find_by_username(username)
        @user.authenticate(password)
      end
    rescue
      render :text => "HTTP Basic: Malformatted header.", :status => :unauthorized
    end
  end

end
