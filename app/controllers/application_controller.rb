class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    token = session[:user_token] || cookies[:user_token]
    if token.present?
      @current_user ||= User.find_by_auth_token!(token)
    end
  end
  helper_method :current_user
  
end
