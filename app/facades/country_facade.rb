class CountryFacade
  # def get_country
  #   service = CountryService.new
  #   request = service.random_country
  #   Country.new(request)
  # end

  def get_country_by_search(country)
    service = CountryService.new
    request = service.country_search(country)
    Country.new(request)
  end
end
