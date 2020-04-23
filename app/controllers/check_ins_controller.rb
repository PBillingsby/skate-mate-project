class CheckInsController < ApplicationController
  def create
    byebug
  end

  def check_in_params
    params.require(:check_in).permit(:notes)
  end
end