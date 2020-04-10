class LocationsController < ApplicationController
  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "location added!"
      redirect_to location_path(@location)
    else
      render 'new'
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:address)
  end
end
