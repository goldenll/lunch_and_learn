require "rails_helper"

RSpec.describe "get air quality", type: :request do
  describe "happy paths" do
    it "returns air quality data for a given country's capital city" do
      get "/api/v1/air_quality?country=Nigeria"

      expect(response).to be_successful

      aq_data = JSON.parse(response.body, symbolize_names: true)

      expect(aq_data).to be_a(Hash)
      expect(aq_data).to have_key(:data)
      expect(aq_data[:data]).to be_a(Hash)
      expect(aq_data[:data]).to have_key(:id)
      expect(aq_data[:data][:id]).to eq("null")
      expect(aq_data[:data]).to have_key(:type)
      expect(aq_data[:data][:type]).to eq("air_quality")
      expect(aq_data[:data]).to have_key(:attributes)
      expect(aq_data[:data][:attributes]).to be_a(Hash)
      expect(aq_data[:data][:attributes]).to have_key(:city)
      expect(aq_data[:data][:attributes][:city]).to be_a(String)
      expect(aq_data[:data][:attributes][:city]).to eq("Abuja")
      expect(aq_data[:data][:attributes]).to have_key(:aqi)
      expect(aq_data[:data][:attributes][:aqi]).to be_an(Integer)
      expect(aq_data[:data][:attributes]).to have_key(:pm25_concentration)
      expect(aq_data[:data][:attributes][:pm25_concentration]).to be_a(Float)
      expect(aq_data[:data][:attributes]).to have_key(:co_concentration)
      expect(aq_data[:data][:attributes][:co_concentration]).to be_a(Float)
    end

    it "returns air quality data for a given country's capital city" do
      get "/api/v1/air_quality?country=France"

      expect(response).to be_successful

      aq_data = JSON.parse(response.body, symbolize_names: true)

      expect(aq_data).to be_a(Hash)
      expect(aq_data).to have_key(:data)
      expect(aq_data[:data]).to be_a(Hash)
      expect(aq_data[:data]).to have_key(:id)
      expect(aq_data[:data][:id]).to eq("null")
      expect(aq_data[:data]).to have_key(:type)
      expect(aq_data[:data][:type]).to eq("air_quality")
      expect(aq_data[:data]).to have_key(:attributes)
      expect(aq_data[:data][:attributes]).to be_a(Hash)
      expect(aq_data[:data][:attributes]).to have_key(:city)
      expect(aq_data[:data][:attributes][:city]).to be_a(String)
      expect(aq_data[:data][:attributes][:city]).to eq("Paris")
      expect(aq_data[:data][:attributes]).to have_key(:aqi)
      expect(aq_data[:data][:attributes][:aqi]).to be_an(Integer)
      expect(aq_data[:data][:attributes]).to have_key(:pm25_concentration)
      expect(aq_data[:data][:attributes][:pm25_concentration]).to be_a(Float)
      expect(aq_data[:data][:attributes]).to have_key(:co_concentration)
      expect(aq_data[:data][:attributes][:co_concentration]).to be_a(Float)
    end

    it "returns air quality data for a given country's capital city" do
      get "/api/v1/air_quality?country=Cuba"

      expect(response).to be_successful

      aq_data = JSON.parse(response.body, symbolize_names: true)

      expect(aq_data).to be_a(Hash)
      expect(aq_data).to have_key(:data)
      expect(aq_data[:data]).to be_a(Hash)
      expect(aq_data[:data]).to have_key(:id)
      expect(aq_data[:data][:id]).to eq("null")
      expect(aq_data[:data]).to have_key(:type)
      expect(aq_data[:data][:type]).to eq("air_quality")
      expect(aq_data[:data]).to have_key(:attributes)
      expect(aq_data[:data][:attributes]).to be_a(Hash)
      expect(aq_data[:data][:attributes]).to have_key(:city)
      expect(aq_data[:data][:attributes][:city]).to be_a(String)
      expect(aq_data[:data][:attributes][:city]).to eq("Havana")
      expect(aq_data[:data][:attributes]).to have_key(:aqi)
      expect(aq_data[:data][:attributes][:aqi]).to be_an(Integer)
      expect(aq_data[:data][:attributes]).to have_key(:pm25_concentration)
      expect(aq_data[:data][:attributes][:pm25_concentration]).to be_a(Float)
      expect(aq_data[:data][:attributes]).to have_key(:co_concentration)
      expect(aq_data[:data][:attributes][:co_concentration]).to be_a(Float)
    end

    xit "will give you air quality information for a random country if no country parameter is passed in" do
      get "/api/v1/air_quality?country=random"

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)


    end

  end
  
  describe "sad paths" do
    xit "returns an empty array when the country passed in is not valid" do
      get "/api/v1/air_quality?country=notarealcountry"

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an(Array)
      expect(recipes[:data]).to eq([])
      expect(recipes[:data].count).to eq(0)
    end
  end
end
