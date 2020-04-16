module LocationsHelper
  def location_show
    @location = Location.find(params[:id])
  end
  
  def geocode_address
    user = User.find(params[:location][:user_id])
    if location_params[:address].blank?
      flash[:error] = "Search can't be empty. Try again"
      redirect_to user_path(user)
    else
      location_search = Geocoder.search(location_params[:address]).first
      @location = Location.find_or_create_by(address: location_params[:address], city: location_search.city, country: location_search.country)
      if @location
        new_check_in = @location.check_ins.find_or_create_by(user_id: user.id)
        new_check_in.location_id = @location.id
        user.check_in = new_check_in
        flash[:success] = "Location Changed!"
        redirect_to user_path(user)
      end
    end
  end
end
