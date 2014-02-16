module AuthHelper

  # https://gist.github.com/mattconnolly/4158961

  # creates a user and sets @env to include its basic auth header
  def user_auth
    @env ||= {}
    username = create(:user).username
    pw = 'password' # FIXME: should not be static
    @env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username, pw)
  end

  # creates a developer and sets @env to include its token auth header
  def token_auth
    @env ||= {}
    @env['X-AUTH-TOKEN'] = create(:developer).access_token
  end

end
