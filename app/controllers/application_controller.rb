class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # TODO: force_ssl

  private

  def current_developer
    @current_developer ||= Developer.find(session[:developer_id]) if session[:developer_id]
  end
  helper_method :current_developer
end
