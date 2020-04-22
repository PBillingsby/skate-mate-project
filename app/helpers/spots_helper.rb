module SpotsHelper
  def spot_search
    if !params[:spot].nil?
      if !spot_params[:location_id].blank?
        @spots = Spot.where(location_id: spot_params[:location_id])
        @location = Location.find(spot_params[:location_id])
        render :index
      end
    else
      @spots = Spot.all.sort_by {|x| x.location.country}
    end
  end

  def spot_admin
    @spot = Spot.find(params[:id])
    if current_user.id != @spot.user_id
      flash[:alert] = "You do not have edit permissions for this spot."
      redirect_to current_user
    end
  end 
end
