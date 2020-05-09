class ApplicationController < ActionController::Base
  helper_method [:current_user, :logged_in?, :current_user_path]
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user_path
    redirect_to user_path(current_user)
  end
end
