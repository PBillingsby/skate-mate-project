module UsersHelper
  def unique_user_check_ins
    check_ins = current_user.check_ins.each {|checkin| checkin.location.city}
    @unique_user_check_ins = check_ins.uniq {|uniq_checkin| uniq_checkin.location.state} # Creates an array of check_ins by unique city
  end

  def user_location
    if last_check_in
      link_to "#{last_check_in.location.city}, #{last_check_in.location.state}, #{last_check_in.location.country}", location_path(last_check_in.location)
    else
      "...nowhere. Check in below to add your location"
    end
  end

  def random_spot
    found = Spot.all.sample
    return found
  end

  def find_users
    found_users = @user.check_ins.last.location.users.uniq
  end

  def check_in
    current_user.spots.present? ? render('users/user_spots') : raw("You have no spots. Click <a href='/spots/new'>here</a> to add one.")
  end

  def user_spots
    current_user.spots
  end

  def geocode_address
    location = Geocoder.search([request.location.latitude, request.location.longitude])
    user_location = Location.find_or_create_by(city: location.first.city, state: location.first.state, country: location.first.country)
    CheckIn.create(user_id: current_user.id, location_id: user_location.id)
  end
end
