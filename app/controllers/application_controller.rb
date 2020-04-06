class ApplicationController < ActionController::Base
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
