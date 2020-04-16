module SpotsHelper
  def edit_del_auth
    if @spot.user.id == current_user.id
      link_to "Edit", edit_spot_path(@spot)
      link_to "Delete", :spot, method: :delete
    end
  end
end
