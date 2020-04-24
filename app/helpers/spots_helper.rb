module SpotsHelper
  def spot_search
    @spots = Spot.where(location_id: spot_params[:location_id]) # Using scope method to search by spot location in spots#index
    @index_location = Location.find(spot_params[:location_id])
    render :index
  end

  def spot_location_set
    @spot = Spot.new(spot_params)
    if spot_params[:location_attributes]
      location_results = Geocoder.search(spot_params[:location_attributes][:city]).first
      @spot.location = Location.find_or_create_by(city: spot_params[:location_attributes][:city], country: location_results.country)
    end
  end
  def spot_admin
    @spot = Spot.find(params[:id]) # Helper method for spot editing authorization
    if current_user.id != @spot.user_id
      flash[:alert] = "You do not have edit permissions for this spot."
      current_user_path
    end
  end
end
