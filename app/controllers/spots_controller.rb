class SpotsController < ApplicationController
  require 'octicons'

  include SpotsHelper
  def index
    @locations = Location.all
    @spots = Spot.all
  end
  def new
    @spot = Spot.new
  end
  def create
    spot = Spot.create(spot_params)
    spot.save
    redirect_to spot_path(spot)
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.delete
    flash.alert = "#{spot.name} has been deleted."
    redirect_to spots_path
  end

  def spot_params
    params.require(:spot).permit(:name, :address, :description, :rating, :image, :location_id, :user_id)
  end
end
