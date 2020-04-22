class UsersController < ApplicationController
  before_action :user_auth, only: [:show, :edit]
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
    @user.update(user_params)
    redirect_to user_path(@user)
  end
end
