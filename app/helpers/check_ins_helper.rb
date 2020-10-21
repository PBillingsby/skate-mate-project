module CheckInsHelper
  def last_check_in
    @check_in_location = current_user.check_ins.last
  end
end