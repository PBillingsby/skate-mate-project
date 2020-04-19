class SpotsController < ApplicationController
  require 'octicons'
  include SpotsHelper
  def index
    if params[:search]
      @spots = Spot.where(rating: params[:search].to_i)
      @spots.count == nil ? flash.alert = "No spots with this rating." : nil
    else
      @spots = Spot.all
    end
  end
  def new
    @spot = Spot.new
  end

  def create
    spot = Spot.create(spot_params)
    flash.alert = "Spot added."
    redirect_to spot
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    spot = Spot.find(params[:id])
    spot.update(spot_params)
    redirect_to spot
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
