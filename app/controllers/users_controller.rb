class UsersController < ApplicationController
  def index
  end
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @location = Location.new
    @user = User.find(params[:id])
  end
end
