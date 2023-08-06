require "rails_helper"

RSpec.describe "get learning resources", type: :request do
  describe "happy paths" do
    xit "returns a video related to the searched country" do
      get "/api/v1/learning_resources?country=laos"

      expect(response).to be_successful
      video = JSON.parse(response.body, symbolize_names: true)

      expect(video).to be_a(Hash)
      expect(video).to have_key(:data)
      expect(video[:data]).to be_a(Hash)
      expect(video[:data]).to have_key(:attributes)
      expect(video[:data][:attributes]).to be_a(Hash)
      expect(video[:data][:attributes]).to have_key(:id)
      expect(video[:data][:attributes][:id]).to be(nil)
      expect(video[:data][:attributes]).to have_key(:title)
      expect(video[:data][:attributes][:title]).to be_a(String)
      expect(video[:data][:attributes]).to have_key(:video_id)
      expect(video[:data][:attributes][:video_id]).to be_a(String)

      expect(video[:data][:attributes]).to_not have_key(:publishedAt)
      expect(video[:data][:attributes]).to_not have_key(:channelId)
      expect(video[:data][:attributes]).to_not have_key(:thumbnails)
      expect(video[:data][:attributes]).to_not have_key(:channelTitle)
    end

    # it "returns a list of recipes for a random country when country is not specified" do
    #   get "/api/v1/recipes?country=random"

    #   expect(response).to be_successful

    #   recipes = JSON.parse(response.body, symbolize_names: true)

    #   expect(recipes).to be_a(Hash)

      
    # end
  # end
  
  # describe "sad paths" do
  #   it "returns an empty array when there are no search matches" do
  #     get "/api/v1/recipes?country=notarealcountry"

  #     expect(response).to be_successful

  #     recipes = JSON.parse(response.body, symbolize_names: true)

  #     expect(recipes).to be_a(Hash)
  #     expect(recipes).to have_key(:data)
  #     expect(recipes[:data]).to be_an(Array)
  #     expect(recipes[:data]).to eq([])
  #     expect(recipes[:data].count).to eq(0)
  #   end

  #   it "returns an empty array when the country parameter is an empty string" do
  #     get "/api/v1/recipes?country=''"

  #     expect(response).to be_successful

  #     recipes = JSON.parse(response.body, symbolize_names: true)

  #     expect(recipes).to be_a(Hash)
  #     expect(recipes).to have_key(:data)
  #     expect(recipes[:data]).to be_an(Array)
  #     expect(recipes[:data]).to eq([])
  #     expect(recipes[:data].count).to eq(0)
  #   end
  end
end
