class Api::V1::AirQualityController < ApplicationController
  def index
    if params[:country] == "random"
      city = CountryFacade.new.get_country.capital
    else 
      city = CountryFacade.new.country_search(params[:country]).capital
    end
    require 'pry'; binding.pry
    @aq = AirQualityFacade.new.get_aq(city.name)
    render json: AirQualitySerializer.new(@aq)
  end
end
