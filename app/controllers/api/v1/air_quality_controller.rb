class Api::V1::AirQualityController < ApplicationController
  def index
    country = CountryFacade.new.get_country
    require 'pry'; binding.pry
    if params[:country] == "random"
    else 

    end
    @aq = AirQualityFacade.new.get_aq(city.name)
    render json: AirQualitySerializer.new(@aq)
  end
end
