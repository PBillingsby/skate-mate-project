module CheckInsHelper
  def geocode_address
    if check_in_params[:city].blank?
      flash[:error] = "Search can't be empty. Try again"
      redirect_to current_user
    else
      check_in_search = Geocoder.search(check_in_params[:city]).first # Finds first instance from city search
      location = Location.find_or_create_by(city: location_params[:city].titleize, country: location_search.country) # Finds or creates location by city
      byebug
      if location
        new_check_in = location.check_ins.find_or_create_by(location_id: location.id, user_id: current_user.id) # Creates user#check_in
        byebug
        current_user.check_ins = new_check_in # Sets user#check_in
        flash[:success] = "You are now skating in #{new_check_in.location.city}!"
        redirect_to user_path(current_user)
      end
    end
  end
end