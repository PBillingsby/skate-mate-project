class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.alert = "Wrong email or password. Try again."
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete :user_id
    current_user = nil
    redirect_to root_url
  end

  def omniauth
    @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
      u.username = auth.info.name
      u.password = SecureRandom.hex
      u.uid = auth.uid
      u.provider = auth.provider
    end
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
