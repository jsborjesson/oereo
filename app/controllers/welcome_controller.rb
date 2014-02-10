class WelcomeController < ApplicationController
  def index
    if current_user
      @access_token = current_user.access_token or nil
    end
  end
end
