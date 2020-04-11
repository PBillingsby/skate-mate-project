module UsersHelper
  def user_location
    if @user.location
      link_to "#{current_user.location.city}, #{current_user.location.country}", location_path(current_user.location)
    else
      "Well, nowhere! Head over to add your location.."
    end
  end
end
