module SpotsHelper
  def edit_del_auth
    if @spot.user.id == current_user.id
      link_to "Delete", :spot, method: :delete
    end
  end

  def geocode_spot
    @location = Location.find_or_create_by(address: spot_params[:address], city: loc.city, country: loc.country)
    @spot = @location.spots.create(spot_params)
    redirect_to spot_path(@spot)
  end
end
