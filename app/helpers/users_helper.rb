module UsersHelper
  def user_name
    if !@user.username.blank?
      "Hey, #{@user.username}"
    else
      form_for @user do |f|
        f.text_field :username, placeholder: "Add Username"
        f.submit
      end
    end
  end
  def user_location
    if @user.check_in
      link_to "#{@user.check_in.location.city}", location_path(@user.check_in.location)
    else
      "Well, nowhere! Check in to add your location..."
    end
  end
end
