class LocationsController < ApplicationController
  def create
    if location_params[:address].blank?
      flash[:error] = "Search can't be empty. Try again"
      redirect_to user_path(current_user)
    else
      user = User.find(params[:id])
      location_search = Geocoder.search(location_params[:address]).first
      @location = Location.new(address: location_params[:address], city: location_search.city, country: location_search.country)
      if @location.save
        flash[:success] = "location added!"
        user.location = @location
        redirect_to user_path(current_user)
      end
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:address, :user_id)
  end
end
