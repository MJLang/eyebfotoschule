class Admin::BaseController < ApplicationController
  before_action :logged_in_as_admin?


  def logged_in_as_admin?
    unless @current_user.try(:is_admin?)
      redirect_to login_path
    end
  end

  def is_admin?
    @current_user.has_role? :admin
  end
  helper_method :is_admin?

end