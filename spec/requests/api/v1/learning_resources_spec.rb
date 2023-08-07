require "rails_helper"

RSpec.describe "get learning resources", type: :request do
  describe "happy paths" do
    it "returns video and photo data related to the searched country" do
      get "/api/v1/learning_resources?country=france"

      expect(response).to be_successful
      lr = JSON.parse(response.body, symbolize_names: true)

      expect(lr).to be_a(Hash)
      expect(lr).to have_key(:data)
      expect(lr[:data]).to be_a(Hash)
      expect(lr[:data]).to have_key(:attributes)
      expect(lr[:data][:attributes]).to be_a(Hash)
      expect(lr[:data][:attributes]).to have_key(:id)
      expect(lr[:data][:attributes][:id]).to eq("null")
      expect(lr[:data][:attributes]).to have_key(:country)
      expect(lr[:data][:attributes][:country]).to be_a(String)
      expect(lr[:data][:attributes][:country]).to eq("france")
      expect(lr[:data][:attributes]).to have_key(:video)
      expect(lr[:data][:attributes][:video]).to be_a(Hash)

      expect(lr[:data][:attributes][:video]).to have_key(:title)
      expect(lr[:data][:attributes][:video][:title]).to be_a(String)
      expect(lr[:data][:attributes][:video]).to have_key(:video_id)
      expect(lr[:data][:attributes][:video][:video_id]).to be_a(String)
      expect(lr[:data][:attributes][:video]).to_not have_key(:publishedAt)
      expect(lr[:data][:attributes][:video]).to_not have_key(:channelId)
      expect(lr[:data][:attributes][:video]).to_not have_key(:thumbnails)
      expect(lr[:data][:attributes][:video]).to_not have_key(:channelTitle)

      expect(lr[:data][:attributes]).to have_key(:images)
      expect(lr[:data][:attributes][:images]).to be_an(Array)
      expect(lr[:data][:attributes][:images][0]).to have_key(:alt_tag)
      expect(lr[:data][:attributes][:images][0][:alt_tag]).to be_a(String)
      expect(lr[:data][:attributes][:images][0]).to have_key(:url)
      expect(lr[:data][:attributes][:images][0][:url]).to be_a(String)
      expect(lr[:data][:attributes][:images][0]).to_not have_key(:slug)
      expect(lr[:data][:attributes][:images][0]).to_not have_key(:color)
      expect(lr[:data][:attributes][:images][0]).to_not have_key(:breadcrumbs)
      expect(lr[:data][:attributes][:images][0]).to_not have_key(:height)
    end
  end
  
  describe "sad paths" do
    it "returns an empty hash when the country parameter is an empty string" do
      get "/api/v1/learning_resources?country=''"

      expect(response).to be_successful

      lr = JSON.parse(response.body, symbolize_names: true)

      expect(lr).to be_a(Hash)
      expect(lr).to have_key(:data)
      expect(lr[:data]).to be_an(Hash)
      expect(lr[:data]).to eq({})
      expect(lr[:data].count).to eq(0)
    end

    it "if no images are found, the image key should point to an empty object" do
      get "/api/v1/learning_resources?country=Nameofcountry"

      expect(response).to be_successful

      lr = JSON.parse(response.body, symbolize_names: true)

      expect(lr).to have_key(:data)
      expect(lr[:data]).to have_key(:attributes)
      expect(lr[:data][:attributes]).to have_key(:id)
      expect(lr[:data][:attributes]).to have_key(:country)
      expect(lr[:data][:attributes][:country]).to eq("Nameofcountry")
      expect(lr[:data][:attributes]).to have_key(:images)
      expect(lr[:data][:attributes][:images]).to be_an(Array)
      expect(lr[:data][:attributes][:images]).to eq([])
    end
  end
end
