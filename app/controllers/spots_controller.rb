class SpotsController < ApplicationController
  require 'octicons'
  include SpotsHelper  
  def index
    if !params[:spot]
      @spots = Spot.all.sort_by {|x| x.location.country}
    else
      spot_search # search spots by selection of locations
      byebug
      @location = Location.find(spot_params[:location_id])
    end
  end

  def new
    @spot = Spot.new
  end

  def create
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
