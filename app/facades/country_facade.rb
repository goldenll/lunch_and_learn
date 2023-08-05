class CountryFacade
  def get_country
    service = CountryService.new
    request = service.random_country
    Country.new(request)
  end
end
