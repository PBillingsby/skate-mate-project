module SpotsHelper
  def spot_search
    @spots = Spot.where(location_id: spot_params[:location_id])
    render :index
  end

  def spot_admin
    @spot = Spot.find(params[:id])
    if current_user.id != @spot.user_id
      flash[:alert] = "You do not have edit permissions for this spot."
      redirect_to current_user
    end
  end
end
