module LocationsHelper
  def user_location
    if @user.location
      "You are currently in #{current_user.location.city}"
    end
  end
end
