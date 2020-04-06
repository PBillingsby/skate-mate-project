class LocationsController < ApplicationController
  def create
    @location = Location.find_or_create_by(city: location_params[:city], state: location_params[:state], country: location_params[:country])
  end

  def location_params
    params.require(:location).permit(:city, :state, :country)
  end
end
