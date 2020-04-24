module SpotsHelper
  def spot_search
    if !params[:spot] || params[:spot][:location_id].blank?
      @spots = Spot.all.sort_by {|x| x.location.country}
    elsif params[:spot][:location_id]
      @spots = Spot.where(location_id: params[:spot][:location_id])
      @index_location = Location.find(spot_params[:location_id])
    else
      @spots = Spot.where(location_id: spot_params[:location_id]) # Using scope method to search by spot location in spots#index
      @index_location = Location.find(spot_params[:location_id])
    end
    render :index
  end

  def spot_location_set
    if spot_params[:city]
      if spot_params[:location_attributes]
        location_results = Geocoder.search(spot_params[:location_attributes][:city]).first
        @spot.location = Location.find_or_create_by(city: spot_params[:location_attributes][:city], country: location_results.country)
      end
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
