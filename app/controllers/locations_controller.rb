class LocationsController < ApplicationController
  def new
    byebug
  end
  def index
    if params[:country]
      @locations = Location.where('country = ?', params[:country])
    else
      @locations = Location.all
      # render json: locations
    end
  end
  def create
  end

  def show
    if !params[:location]
      @location = Location.find_by(id: params[:id])
    else
      @location = Location.find_by(id: params[:location][:id])
    end
    if @location.nil?
      redirect_to locations_path
    else
      @spot = @location.spots.build
    end
  end

  def location_params
    params.require(:location).permit(:city, :user_id, :image)
  end
end
