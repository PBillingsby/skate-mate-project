class LocationsController < ApplicationController
  include LocationsHelper
  def index
    @locations = Location.all
  end
  def create
    geocode_address
  end

  def show
    @location = Location.find(params[:id])
  end

  def update
    byebug
  end

  def location_params
    params.require(:location).permit(:city, :user_id)
  end
end
