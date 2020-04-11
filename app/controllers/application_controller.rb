class ApplicationController < ActionController::Base
  helper_method [:current_user, :logged_in?, :user_auth]
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :location, location_attributes: [:address])
  end
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    byebug
    session[:current_user]
  end

  def user_auth
    if params[:id].to_i != current_user.id
      flash[:error] = "Not authorized to view this profile."
      redirect_to user_path(current_user)
    end
  end
  def user_error_handle
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "User doesn't exist"
      redirect_to user_path(current_user)
    end
  end
end
