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
        byebug
        check_in = @location.check_ins.create(user_id: user.id)
        flash[:success] = "Location Changed!"
        # user.update(location_id: @location.id)
        redirect_to user_path(user)
      end
    end
  end
end
