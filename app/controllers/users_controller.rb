class UsersController < ApplicationController
  include UsersHelper
  before_action :user_auth, only: [:show, :edit]
  # before_action :show, :user_check_in
  def index
    @user = User.new
    if current_user
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :index
    end
  end

  def show
    @location = Location.new
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.check_ins.create(user_params[:city])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, location: [:city])
  end
end
