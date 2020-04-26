module UsersHelper
  def unique_user_check_ins
    check_ins = @user.check_ins.each {|x| x.location.city}
    @unique_user_check_ins = check_ins.uniq {|x| x.location.city} # Creates an array of check_ins by unique city
  end

  def user_location
    user_check_in = current_user.check_ins.last
    if user_check_in # If a user has a check_in, link user to location#show
      link_to "#{user_check_in.location.city}, #{user_check_in.location.country}", location_path(user_check_in.location)
    else
      "...nowhere. Check in below to add your location" # Prompts user to add user#location if no check_in 
    end
  end

  def check_in
    current_user.spots.present? ? render('users/user_spots') : ("You have no spots. Click <a href='/spots/new'>here</a> to add one.".html_safe)
  end
end
