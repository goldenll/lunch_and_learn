class Api::V1::AirQualityController < ApplicationController
  def index 
    city = fetch_city(params[:country])
    if city.nil?
      render json: { error: "Country not found" }, status: :unprocessable_entity
      return
    end

    aq = fetch_air_quality(city)
    render json: AirQualitySerializer.new(aq)
  end

  private 

  def fetch_city(country)
    country_data = CountryService.new.country_search(country)
    country_data[0] ? country_data[0][:capital].first : nil
  end

  def fetch_air_quality(city)
    AirQualityFacade.new.get_aq(city)
  end
end
