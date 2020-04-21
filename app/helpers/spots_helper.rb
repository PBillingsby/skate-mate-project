module SpotsHelper
  def spot_search
    if !params[:spot].nil?
      if !spot_params[:location_id].blank?
        @spots = Spot.where(location_id: spot_params[:location_id])
        render :index
      else
        @spots = Spot.all
      end
    else
      @spots = Spot.all
    end
  end
end
