class Api::ApiController < ApplicationController

  respond_to :json, :xml

  # turn off csrf for api-calls
  skip_before_filter :verify_authenticity_token

  before_filter :authorize_token!

  # move this to individual controllers
  before_filter :authorize_user!, except: [:index, :show]

protected

  def authorize_token!
    token = request.headers['X-AUTH-TOKEN']
    unless ApiKey.exists?(access_token: token)
      render :text => "Invalid access token", :status => :unauthorized
    end
  end

  def authorize_user!
    authenticate_or_request_with_http_basic do |username, password|
      User.find_by_username(username).authenticate(password)
    end
  end

end
