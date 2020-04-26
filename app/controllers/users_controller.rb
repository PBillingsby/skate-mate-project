class UsersController < ApplicationController
  include UsersHelper
  before_action :user_auth, only: [:show, :edit]
  def index
    @user = User.new
    current_user ? current_user_path : nil# Redirect to current user path method
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      current_user_path
    else
      render :index
    end
  end

  def show
    @user = current_user
    @spot = Spot.new
    @current_user_check_in = current_user.check_ins.last
    @location = @user.locations.build
  end

  def edit
  end

  def update
    find_user
    @user.update(username: user_params[:username])
    current_user_path
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, location: [:city])
  end
  private

  def find_user
    @user = User.find(params[:id])
  end
  
  def user_auth
    if params[:id].to_i != current_user.id
      flash[:error] = "Not authorized to view this page."
      current_user_path
    else
      @user = User.find(params[:id])
    end
  end
end
