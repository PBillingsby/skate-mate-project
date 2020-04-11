class ApplicationController < ActionController::Base
  helper_method [:current_user, :logged_in?]
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    byebug
    session[:current_user]
  end
end
