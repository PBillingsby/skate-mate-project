module UsersHelper
  def user_name
    if !@user.username.blank?
      "Hey, #{@user.username}"
    end
  end
  def user_location
    if @user.check_in
      link_to "#{@user.check_in.location.city}", location_path(@user.check_in.location)
    else
      "Well, nowhere! Check in to add your location..."
    end
  end

  def spots
    Spot.all
  end
end
