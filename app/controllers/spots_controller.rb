class SpotsController < ApplicationController
  include SpotsHelper
  def index
    @spots = Spot.all
  end
  def new
    @spot = Spot.new
  end
  def create
    geocode_spot
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
    params.require(:spot).permit(:name, :address, :description, :rating, :img, :location_id, :user_id)
  end
end
