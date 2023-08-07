require "rails_helper"

RSpec.describe "get recipes", type: :request do
  describe "happy paths" do
    it "returns a list of recipes for a given country" do
      get "/api/v1/recipes?country=thailand"

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an(Array)
      expect(recipes[:data].first).to have_key(:id)
      expect(recipes[:data].first[:id]).to eq("null")
      expect(recipes[:data].first).to have_key(:type)
      expect(recipes[:data].first[:type]).to eq("recipe")
      expect(recipes[:data].first).to have_key(:attributes)
      expect(recipes[:data].first[:attributes]).to be_a(Hash)
      expect(recipes[:data].first[:attributes]).to have_key(:title)
      expect(recipes[:data].first[:attributes][:title]).to be_a(String)
      expect(recipes[:data].first[:attributes]).to have_key(:url)
      expect(recipes[:data].first[:attributes][:url]).to be_a(String)
      expect(recipes[:data].first[:attributes]).to have_key(:country)
      expect(recipes[:data].first[:attributes][:country]).to be_a(String)
      expect(recipes[:data].first[:attributes][:country]).to eq("thailand")
      expect(recipes[:data].first[:attributes]).to have_key(:image)
      expect(recipes[:data].first[:attributes][:image]).to be_a(String)

      expect(recipes[:data].first[:attributes]).to_not have_key(:healthLabels)
      expect(recipes[:data].first[:attributes]).to_not have_key(:calories)
      expect(recipes[:data].first[:attributes]).to_not have_key(:cuisineType)
      expect(recipes[:data].first[:attributes]).to_not have_key(:dishType)
    end

    it "returns a list of recipes for a random country when country is not specified" do
      get "/api/v1/recipes?country=random"

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an(Array)
      expect(recipes[:data].first[:id]).to eq("null")
      expect(recipes[:data].first).to have_key(:type)
      expect(recipes[:data].first[:type]).to eq("recipe")
      expect(recipes[:data].first).to have_key(:attributes)
      expect(recipes[:data].first[:attributes]).to be_a(Hash)
      expect(recipes[:data].first[:attributes]).to have_key(:title)
      expect(recipes[:data].first[:attributes][:title]).to be_a(String)
      expect(recipes[:data].first[:attributes]).to have_key(:url)
      expect(recipes[:data].first[:attributes][:url]).to be_a(String)
      expect(recipes[:data].first[:attributes]).to have_key(:country)
      expect(recipes[:data].first[:attributes][:country]).to be_a(String)
      expect(recipes[:data].first[:attributes][:country]).to_not eq("random")
      expect(recipes[:data].first[:attributes]).to have_key(:image)
      expect(recipes[:data].first[:attributes][:image]).to be_a(String)

      expect(recipes[:data].first[:attributes]).to_not have_key(:healthLabels)
      expect(recipes[:data].first[:attributes]).to_not have_key(:calories)
      expect(recipes[:data].first[:attributes]).to_not have_key(:cuisineType)
      expect(recipes[:data].first[:attributes]).to_not have_key(:dishType)
    end
  end
  
  describe "sad paths" do
    it "returns an empty array when there are no search matches" do
      get "/api/v1/recipes?country=notarealcountry"

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an(Array)
      expect(recipes[:data]).to eq([])
      expect(recipes[:data].count).to eq(0)
    end

    it "returns an empty array when the country parameter is an empty string" do
      get "/api/v1/recipes?country=''"

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
