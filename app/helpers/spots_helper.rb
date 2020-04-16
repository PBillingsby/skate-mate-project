module SpotsHelper
  def edit_del_auth
    if @spot.user.id == current_user.id
      link_to "Delete", :spot, method: :delete
    end
  end

  def geocode_spot
    location_search = Geocoder.search(spot_params[:address]).first
    location = Location.find_or_create_by(address: spot_params[:address], city: location_search.city, country: location_search.country)
    spot = Spot.new(spot_params)
    spot.location = location
    spot.user = current_user
    spot.save
    byebug
    # @spot = location.spots.create(spot_params)
    redirect_to spot_path(spot)
  end
end
