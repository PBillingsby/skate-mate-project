class UsersController < ApplicationController
  def index
    @user = User.new
    if current_user
      redirect_to user_path(current_user)
    end
  end
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.location = Location.new
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.alert = "Sign up details incorrect. Try again."
      render :new
    end
  end

  def show
    user_error_handle
  end

  def edit
    @user = User.new
    user_error_handle
  end

  def update
    @user = User.find(params[:id])
    byebug
    @user.update(user_params)
    if params[:user][:location]
       # FIX TO UPDATE ALL ATTRIBUTES OF LOCATION
      redirect_to user_path(@user)
    end
  end
end
