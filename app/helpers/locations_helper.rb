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
      @location = Location.new(address: location_params[:address], city: location_search.city, country: location_search.country) #Will keep original search query for address
      if @location.save
        flash[:success] = "location added!"
        user.update(location_id: @location.id).save
        redirect_to user_path(user)
      end
    end
  end
end
