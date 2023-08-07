class CountryService 
  def conn
    Faraday.new(url: "https://restcountries.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def random_country
    response = get_url("/v3.1/all")
    country = response.sample
  end

  def country_search(country)
    response = get_url("/v3.1/name/#{country}")
  end
end
