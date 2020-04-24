class SpotsController < ApplicationController
  require 'octicons'
  include SpotsHelper  
  def index
    if !params[:location_id].blank?
      @spots = Spot.where(location_id: params[:location_id])
      @index_location = Location.find(params[:location_id])
    else
      spot_search # search spots by selection of locations
      @location = Location.find(params[:location_id]) unless params[:location_id].nil?
    end
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    spot_location_set # Sets from new or existing location
    if @spot.save
      flash[:alert] = "Spot added."
      redirect_to spot_path(@spot)
    else
      render :'locations/index'
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @comment = Comment.new
    @location = Location.new
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
