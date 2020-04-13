module UsersHelper

  def user_name
    if @user.username.blank?
      nil
    elsif @user.username
    "Hey, #{@user.username}"
    end
  end
  def user_location
    if @user.location_id
      link_to "#{@user.location.city}, #{@user.location.country}", location_path(@user.location)
    else
      "Well, nowhere! Head over to add your location..."
    end
  end

  
end
