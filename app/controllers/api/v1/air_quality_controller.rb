class Api::V1::AirQualityController < ApplicationController
  def index
    city = CountryFacade.new.get_country_by_search(params[:country]).capital
    @aq = AirQualityFacade.new.get_aq(city)
    render json: AirQualitySerializer.new(@aq)
  end
end

# extension work that I gave up on:
#   def index
#     if params[:country] == "random"
#       city = CountryFacade.new.get_country.capital
#     else 
#       city = CountryFacade.new.country_search(params[:country]).capital
#     end
#     require 'pry'; binding.pry
#     @aq = AirQualityFacade.new.get_aq(city.name)
#     render json: AirQualitySerializer.new(@aq)
#   end

# def index
#   require 'pry'; binding.pry
#   if CountryService.new.country_search(params[:country])[:status] == 404
#     render json: { error: "Country not found" }, status: :unprocessable_entity
#     return
#   else
#     city = CountryFacade.new.get_country_by_search(params[:country]).capital
#   end
#   @aq = AirQualityFacade.new.get_aq(city)
#   render json: AirQualitySerializer.new(@aq)
# end

# def index
#   country_data = CountryService.new.country_search(params[:country])
  
#   if country_data.is_a?(Array) && country_data.empty?
#     render json: { error: "Country not found" }, status: :unprocessable_entity
#     return
#   else
#     city = CountryFacade.new.get_country_by_search(params[:country]).capital
#     @aq = AirQualityFacade.new.get_aq(city)
#     render json: AirQualitySerializer.new(@aq)
#   end
# end