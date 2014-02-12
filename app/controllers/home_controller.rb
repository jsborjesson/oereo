class HomeController < ApplicationController
  def index
    if current_user
      @access_token = current_user.access_token
    end
  end
end
