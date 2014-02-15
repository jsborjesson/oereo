class Api::ApiController < ApplicationController

  respond_to :json, :xml

  before_filter :authorize_token
  before_filter :authorize_user, except: [:index, :show]

  private

  def authorize_token
    token = request.headers['X-AUTH-TOKEN']
    unless ApiKey.exists?(access_token: token)
      render :text => "Invalid access token", :status => :unauthorized
    end
  end

  def authorize_user
    authenticate_or_request_with_http_basic do |username, password|
      User.find_by_username(username).authenticate(password)
    end
  end

end
