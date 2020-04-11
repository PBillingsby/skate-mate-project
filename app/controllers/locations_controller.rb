class LocationsController < ApplicationController
  def create
    location_search = Geocoder.search(location_params[:address]).first
    @location = Location.new(address: location_params[:address], city: location_search.city, country: location_search.country)
    if @location.save
      flash[:success] = "location added!"
      byebug
      redirect_to user_path(current_user)
    else
      flash[:error] = "No search results. Try again"
      render 'new'
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:address, :user_id)
  end
end
