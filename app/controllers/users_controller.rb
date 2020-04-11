class UsersController < ApplicationController
  def index
    if current_user
      redirect_to user_path(current_user)
    end
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
      flash.alert = "Sign up details incorrect. Try again."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:location]
      @user.location.update(address: "Sydney, NSW")
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :location, location_attributes: [:address])
  end
end
