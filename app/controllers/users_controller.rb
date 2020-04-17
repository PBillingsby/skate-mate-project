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
    if user.save
      session[:user_id] = user.id
      redirect_to @user
    else
      flash.alert = "Sign up details incorrect. Try again."
      render :new
    end
  end

  def show
    @location = Location.new
    user_error_handle
  end

  def edit
    @user = User.new
    user_error_handle
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
end
