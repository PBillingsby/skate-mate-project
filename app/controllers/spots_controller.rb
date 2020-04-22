class SpotsController < ApplicationController
  require 'octicons'
  include SpotsHelper
  before_action :spot_admin, only: [:edit] 
  def index
    spot_search
  end
  def new
    @spot = Spot.new
  end

  def create
    spot = Spot.new(spot_params)
    if spot.save
      flash.alert = "Spot added."
      redirect_to spot
    else
      flash.alert = "Spot needs name and address"
      redirect_to location_path(spot_params[:location_id])
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
    params.require(:spot).permit(:name, :address, :description, :rating, :image, :location_id, :user_id)
  end
end
