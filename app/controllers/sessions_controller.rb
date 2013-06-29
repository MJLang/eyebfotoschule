class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by_email!(params[:email])
    if @user.authenticate(params[:password]) && @user.has_role?(:admin)
      flash[:success] = "Erfolgreich angemeldet"
      params[:remember_me] ? cookies[:user_token] = @user.auth_token : session[:user_token] = @user.auth_token
      redirect_to admin_dashboard_path
      
    else
      flash[:error] = "Yep ne."
      redirect_to login_path
    end
  rescue Exception 
    flash[:error] = "Leider konnten wir die Email/Password Kombination nicht finden"
    redirect_to login_path
  end

  def destroy
  end

end
