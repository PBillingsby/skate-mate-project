class CheckInsController < ApplicationController
  include UsersHelper
  def create
    # geocode_address 
    byebug
    current_user.check_ins.create(location_id: @check_in_location.id)
    current_user_path
  end

  def check_in_params
    params.require(:check_in).permit(:notes, :city)
  end
end