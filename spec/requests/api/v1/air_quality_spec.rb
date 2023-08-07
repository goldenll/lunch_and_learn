require "rails_helper"

RSpec.describe "get air quality", type: :request do
  describe "happy paths" do
    it "returns air quality data for a given country's capital city" do
      get "/api/v1/air_quality?country=Nigeria"

      expect(response).to be_successful

      aq_data = JSON.parse(response.body, symbolize_names: true)

      expect(aq_data).to be_a(Hash)
      expect(aq_data).to have_key(:data)
      expect(aq_data[:data]).to be_an(Array)
      expect(aq_data[:data].first).to have_key(:id)
      expect(aq_data[:data].first[:id]).to be(nil)
      expect(aq_data[:data].first).to have_key(:type)
      expect(aq_data[:data].first[:type]).to eq("recipe")
      expect(aq_data[:data].first).to have_key(:attributes)
      expect(aq_data[:data].first[:attributes]).to be_a(Hash)
      expect(aq_data[:data].first[:attributes]).to have_key(:title)
      expect(aq_data[:data].first[:attributes][:title]).to be_a(String)
      expect(aq_data[:data].first[:attributes]).to have_key(:url)
      expect(aq_data[:data].first[:attributes][:url]).to be_a(String)
      expect(aq_data[:data].first[:attributes]).to have_key(:country)
      expect(aq_data[:data].first[:attributes][:country]).to be_a(String)
      expect(aq_data[:data].first[:attributes][:country]).to eq("thailand")
      expect(aq_data[:data].first[:attributes]).to have_key(:image)
      expect(aq_data[:data].first[:attributes][:image]).to be_a(String)
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
