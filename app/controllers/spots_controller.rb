class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end
  def new
    @spot = Spot.new
  end
  def create
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

  def spot_params
    params.require(:spot).permit(:name, :address, :description, :rating, :location_id, :user_id, location_attributes: [])
  end
end
