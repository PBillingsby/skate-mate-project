module SpotsHelper
  def spot_search
    if spot_params[:location_id].blank?
      @spots = Spot.all
    elsif params[:location_id]
      @spots = Spot.where(location_id: params[:location_id])
    elsif spot_params[:location_id]
      @spots = Spot.where(location_id: spot_params[:location_id])
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
