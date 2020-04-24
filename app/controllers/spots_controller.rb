class SpotsController < ApplicationController
  require 'octicons'
  include SpotsHelper  
  def index
    if !params[:spot]
      @spots = Spot.all.sort_by {|x| x.location.country}
    else
      spot_search # search spots by selection of locations
    end
  end

  def new
    @spot = Spot.new
  end

  def create
    spot = Spot.new(spot_params)
    byebug

    location = Location.find_or_create_by(city: spot_params[:location_attributes][:city])
    if spot.save
      flash[:alert] = "Spot added."
      redirect_to spot_path(spot)
    else
      render :'locations/index'
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @location = @spot.locations.build
    @comment = @spot.comments.build
  end

  def edit
    spot_admin # Helper method for editing spots authorization
  end

  def update
    spot = Spot.find(params[:id])
    spot.update(spot_params)
    flash[:alert] = "Spot updated."
    redirect_to spot
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.delete
    flash.alert = "#{spot.name} has been deleted."
    redirect_to current_user
  end

  def spot_params
    params.require(:spot).permit(:name, :address, :description, :rating, :image, :user_id, :location_id, location_attributes: [:city])
  end
end
