class LocationsController < ApplicationController
  def create
    byebug
    @location = Location.find_or_create_by(city: location_params[:city], state: location_params[:state], country: location_params[:country])
    if location_params[:user_id]
      current_user.location = @location
      redirect_to user_path(current_user)
    end
  end

  def location_params
    params.require(:location).permit(:city, :state, :country, :user_id)
  end
end
