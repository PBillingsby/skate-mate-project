module UsersHelper
  def unique_user_check_ins
    check_ins = current_user.check_ins.each {|x| x.location.city}
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

  def user_spots
    current_user.spots
  end

  def geocode_address
    byebug
  #   location = Geocoder.search([request.location.latitude, request.location.longitude])
  #   byebug
  #   if location
  #     current_user.check_ins.create(location_id: location.id)
  #   end
  #   #   flash[:error] = "Search can't be empty. Try again"
  #   #   current_user_path
  #   # end
  #   # if check_in_params[:city].blank?
  #   #   flash[:error] = "Search can't be empty. Try again"
  #   #   current_user_path
  #   # else
  #   #   check_in_search = Geocoder.search(check_in_params[:city]).first # Finds first instance from city search
  #   #   if !check_in_search
  #   #     flash[:alert] = "No such place. Please try again"
  #   #     @check_in_location = last_check_in
  #   #   else
  #   #     @check_in_location = Location.find_or_create_by(city: check_in_params[:city].titleize, country: check_in_search.country)
  #   #   end
  #   # end 
  end
end
