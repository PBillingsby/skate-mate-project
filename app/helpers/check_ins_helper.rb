module CheckInsHelper
  def geocode_address
    if check_in_params[:city].blank?
      flash[:error] = "Search can't be empty. Try again"
      current_user_path
    else
      check_in_search = Geocoder.search(check_in_params[:city]).first # Finds first instance from city search
      if !check_in_search
        flash[:alert] = "No such place. Please try again"
        @check_in_location = last_check_in

      else
        @check_in_location = Location.find_or_create_by(city: check_in_params[:city].titleize, country: check_in_search.country)
      end
    end 
  end

  def last_check_in
    @check_in_location = current_user.check_ins.last
  end
end