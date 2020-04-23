class SpotsController < ApplicationController
  require 'octicons'
  include SpotsHelper
  # before_action :set_spot
  
  def index
    if params[:location_id] || params[:spot]
      spot_search
    else
      @spots = Spot.all.sort_by {|x| x.location.country}
    end
  end

  def new
    @spot = Spot.new
  end

  def create
    spot = Spot.new(spot_params)
    location = Location.find(spot_params[:location_id])
    if spot.save
      flash[:alert] = "Spot added."
      redirect_to spot_path(spot)
    else
      render :'locations/index'
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def edit
    spot_admin
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
    redirect_to spots_path
  end

  def spot_params
    params.require(:spot).permit(:name, :address, :description, :rating, :image, :location_id, :user_id, :location)
  end
end
