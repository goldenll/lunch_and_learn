class AirQualityFacade
  def get_aq(city)
    service = AirQualityService.new
    request = service.aq_search(city)
    AirQuality.new(request, city)
  end
end
