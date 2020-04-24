module CheckInsHelper
  def geocode_address
    if check_in_params[:city].blank?
      flash[:error] = "Search can't be empty. Try again"
      redirect_to current_user
    else
      check_in_search = Geocoder.search(check_in_params[:city]).first # Finds first instance from city search
      if !check_in_search
        flash[:alert] = "No such place. Please try again"
        render :'users/show'
      end
      @check_in_location = Location.find_or_create_by(city: check_in_params[:city].titleize, country: check_in_search.country) # Finds or creates location by city
    end 
  end
end