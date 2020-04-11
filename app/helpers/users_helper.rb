module UsersHelper
  def user_location
    if @user.location
      link_to "#{current_user.location.city}, #{current_user.location.country}", location_path(current_user.location)
    end
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    byebug
    session[:current_user]
  end
end
