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
    spot = Spot.new(spot_params)
    if spot.save
      redirect_to spot_path(spot)
    else
      flash.error = "Fill all fields and try again"
      render 'spots/form'
    end
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
