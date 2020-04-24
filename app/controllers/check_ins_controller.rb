class CheckInsController < ApplicationController
  include CheckInsHelper
  def create
    geocode_address # Helper method to create a user check_in with location
    current_user.check_ins.create(notes: check_in_params[:notes], location_id: @check_in_location.id)
    redirect_to user_path(current_user)
  end

  def check_in_params
    params.require(:check_in).permit(:notes, :city)
  end
end