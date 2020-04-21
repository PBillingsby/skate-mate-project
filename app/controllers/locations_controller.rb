class LocationsController < ApplicationController
  include LocationsHelper
  def index
    @locations = Location.all
  end
  def create
    geocode_address # Located in helpers#location. Creates locations and check_ins
  end

  def show
    if !params[:location]
      @location = Location.find(params[:id])
    else
      @location = Location.find(params[:location][:id])
    end
  end

  def location_params
    params.require(:location).permit(:city, :user_id, :image)
  end
end
