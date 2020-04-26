module UsersHelper
  def unique_user_check_ins
    check_ins = @user.check_ins.each {|x| x.location.city}
    @unique_user_check_ins = check_ins.uniq {|x| x.location.city} # Creates an array of check_ins by unique city
  end

  def user_location
    if last_check_in # Instance variable for last user check in
      link_to "#{last_check_in.location.city}, #{last_check_in.location.country}", location_path(last_check_in.location)
    else
      "...nowhere. Check in below to add your location" # Prompts user to add user#location if no check_in 
    end
  end

  def check_in
    current_user.spots.present? ? render('users/user_spots') : ("You have no spots. Click <a href='/spots/new'>here</a> to add one.".html_safe)
  end
end
