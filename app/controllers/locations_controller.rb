class LocationsController < ApplicationController
  def index
    if params[:country]
      @locations = Location.where('country = ?', params[:country])
    else
      @locations = Location.all
    end
  end
  def create
    # geocode_address # Located in helpers#check_in. Creates check_ins, and locations through check_ins
  end

  def show
    if !params[:location]
      @location = Location.find(params[:id])
    else
      @location = Location.find(params[:location][:id])
    end
    @spot = @location.spots.build
  end

  def location_params
    params.require(:location).permit(:city, :user_id, :image)
  end
end
