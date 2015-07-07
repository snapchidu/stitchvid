require 'omniauth-google-oauth2'

class SessionsController < ApplicationController
  def create
    if Rails.env.test?
      user = User.from_omniauth(OmniAuth.config.mock_auth[:google])
    else
      user = User.from_omniauth(request.env['omniauth.auth'])
    end
    session[:user_id] = user.id
    flash[:success] = "Welcome, #{user.name}"
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Goodbye!"
    redirect_to root_url
  end
end