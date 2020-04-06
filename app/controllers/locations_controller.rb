class LocationsController < ApplicationController
  def create
    byebug
  end

  def location_params
    params.require(:location).permit(:city, :state, :country)
  end
end
