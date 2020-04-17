module LocationsHelper
  def location_show
    @location = Location.find(params[:id])
  end
  
  def geocode_address
    if location_params[:city].blank?
      flash[:error] = "Search can't be empty. Try again"
      redirect_to location_path(@location)
    else
      location_search = Geocoder.search(location_params[:city]).first
      @location = Location.find_or_create_by(city: location_params[:city], country: location_search.country)
      if @location
        new_check_in = current_user.check_in.find_or_create_by(location_id: @location.id)
        current_user.save
        byebug
        flash[:success] = "Location Changed!"
        redirect_to user_path(user)
      end
    end
  end
end
