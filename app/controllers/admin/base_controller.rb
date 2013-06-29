class Admin::BaseController < ApplicationController
  before_action :logged_in_as_admin?

 layout 'admin'

  def logged_in_as_admin?
    unless current_user && current_user.has_role?(:admin)
      flash[:error] = "Keine Admin Privilegien"
      redirect_to login_path
    end
  end


end