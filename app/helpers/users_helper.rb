module UsersHelper

  def user_check_in
    if current_user
      @user_check_in = current_user.check_ins.last
    end
  end
  def user_location
    @last_check_in = @user.check_ins.last
    if @last_check_in # If a user has a check_in, link user to location#show
      link_to "#{@last_check_in.location.city}", location_path(@last_check_in.location)
    else
      "Well, nowhere! Check in to add your location..." # Prompts user to add user#location if no check_in 
    end
  end

  def check_in
    if !@user.spots.present? && @user_check_in # If user has no spots, but user is checked in
      link_to "Click here to add spots", location_path(@user_check_in.location) # Show add spot link
    elsif !@user_check_in # If user not checked in
      "Check in to add spots."  # Show this
    else
      byebug
      render 'user_spots' # If user has spots, and is checked in, render user spots partial
    end
  end
end
