module SpotsHelper
  def edit_del_auth
    if @spot.user.id == current_user.id
      link_to "Delete", :spot, method: :delete
    end
  end
end
