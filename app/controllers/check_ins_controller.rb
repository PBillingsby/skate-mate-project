class CheckInsController < ApplicationController
  include CheckInsHelper
  def create
    geocode_address
  end

  def check_in_params
    params.require(:check_in).permit(:notes, :city)
  end
end