class AirQualityService 
  def conn
    Faraday.new(url: "https://api.api-ninjas.com") do |f|
      f.headers["X-Api-Key"] = ENV["API_NINJAS_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def aq_search(city)
    response = get_url("/v1/airquality?city=#{city}")
  end
end
