module UsersHelper

  def user_name
    if @user.username.blank?
      nil
    elsif @user.username
    "Hey, #{@user.username}"
    end
  end
  def user_location
    if @user.check_in
      link_to "#{@user.check_in.location.city}", location_path(@user.check_in.location)
    else
      "Well, nowhere! Head over to add your location..."
    end
  end

  
end
