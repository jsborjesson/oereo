class SessionsController < ApplicationController
  def new
  end

  def create
    developer = Developer.find_by_email(params[:email])
    if developer && developer.authenticate(params[:password])
      session[:developer_id] = developer.id
      redirect_to root_url, flash: { success: 'Successfully logged in' }
    else
      flash.now.alert = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session[:developer_id] = nil
    redirect_to root_url, notice: 'Logged out'
  end
end
