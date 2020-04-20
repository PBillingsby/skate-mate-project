class SpotsController < ApplicationController
  require 'octicons'
  include SpotsHelper
  def index
    @locations = Location.all
    case params
    when params[:search_city]
      @spots = Spot.location.where(city: params[:search_city])
    when params[:search_rating]
      @spots = Spot.where("RATING(spot) == ?", params[:search].to_i)
    end
    byebug

    render :index
  end
  def new
    @spot = Spot.new
  end

  def create
    spot = Spot.create(spot_params)
    spot.comments.create(content: params[:comments][:content], user_id: spot.user_id)
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
    params.require(:spot).permit(:name, :address, :description, :rating, :image, :location_id, :user_id, comments: [:content])
  end
end
