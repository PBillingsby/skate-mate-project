class UsersController < ApplicationController
  include UsersHelper
  before_action :user_auth, only: [:show, :edit]
  def index
    @user = User.new
    if current_user
      current_user_path # Redirect to current user path method
    end
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
    @location = @user.locations.new
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.check_ins.create(user_params[:city])
    @user.update(user_params)
    current_user_path
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, location: [:city])
  end

  private
  def user_auth
    if params[:id].to_i != current_user.id
      flash[:error] = "Not authorized to view this page."
      current_user_path
    else
      @user = User.find(params[:id])
    end
  end
end
