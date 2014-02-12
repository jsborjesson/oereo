class HomeController < ApplicationController
  def index
    if current_developer
      @access_token = current_developer.access_token
    end
  end
end
