module LocationsHelper
  def search_location
    @location = Location.find_by(country: params[:country]).first
  end
end
