module UsersHelper
  def user_location
    if @user.check_in # If a user has a check_in, link user to location#show
      link_to "#{@user.check_in.location.city}", location_path(@user.check_in.location)
    else
      "Well, nowhere! Check in to add your location..." # Prompts user to add user#location if no check_in 
    end
  end

  def user_auth
    if params[:id].to_i != current_user.id # If user tries to access someone elses page
      flash[:alert] = "Not authorized to view this page." # Show error
      redirect_to user_path(current_user)
    else
      @user = User.find(params[:id])
    end
  end

  def check_in
    if !@user.spots.present? && @user.check_in # If user has no spots, but user is checked in
      link_to "Click here to add spots", location_path(@user.check_in.location) # Show add spot link
    elsif !@user.check_in # If user not checked in
      "Check in to add spots."  # Show this
    else
      render 'user_spots' # If user has spots, and is checked in, render user spots partial
    end
  end
end
