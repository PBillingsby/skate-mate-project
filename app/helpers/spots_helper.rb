module SpotsHelper

  def spot_search
    if request.url == "http://localhost:3000/highest_rated"
      @spots = Spot.highest_rating
    elsif !params[:spot] || spot_params[:location_id].blank?
      @spots = Spot.all
    else
      @spots = Spot.where(location_id: spot_params[:location_id]) # Using scope method to search by spot location in spots#index
    end
    @index_location = Location.find(spot_params[:location_id]) unless !params.has_key?(:spot)
    @location = Location.find(params[:location_id]) unless params[:location_id].nil?
  end

  def spot_location_set
    if spot_params[:location_attributes]
      location_results = Geocoder.search(spot_params[:location_attributes][:city]).first
      @spot.location = Location.find_or_create_by(city: spot_params[:location_attributes][:city].titleize, country: location_results.country)
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
