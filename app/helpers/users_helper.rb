module UsersHelper

  def user_name
    if @user.username.blank?
      nil
    elsif @user.username
    "Hey, #{@user.username}"
    end
  end
  def user_location
    if !@user.check_in.empty?
      link_to "#{@user.check_in.last.location.city}", user_check_in_path(@user)
    else
      "Well, nowhere! Head over to add your location..."
    end
  end
end
