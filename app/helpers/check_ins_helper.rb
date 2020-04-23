module CheckInsHelper
  def geocode_address
    if check_in_params[:city].blank?
      flash[:error] = "Search can't be empty. Try again"
      redirect_to current_user
    else
      check_in_search = Geocoder.search(check_in_params[:city]).first # Finds first instance from city search
      @check_in_location = Location.find_or_create_by(city: check_in_params[:city].titleize, country: check_in_search.country) # Finds or creates location by city
      # if location
      #   new_check_in = current_user.check_ins.find_or_create_by(location_id: location.id, notes: check_in_params[:notes]) # Creates user#check_in
      #   flash[:success] = "You are now skating in #{new_check_in.location.city}!"
      #   redirect_to user_path(current_user)
      # end
    end
  end
end