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

  def my_link_to(text, href)
    "<a href='#{href}'>#{text}</a>".html_safe
  end

  def check_in
    if !@user.spots.present? && @user.check_in
      link_to "Click here to add spots", location_path(@user.check_in.location)
    elsif !@user.check_in 
      "Check in to add spots."
    else
      render 'user_spots'
    end
  end 

  def spots
    Spot.all
  end
end
