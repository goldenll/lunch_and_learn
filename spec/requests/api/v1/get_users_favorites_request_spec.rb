require "rails_helper"

RSpec.describe "get favorites", type: :request do
  describe "happy paths" do
    it "returns a users favorited recipes" do
      user1 = create(:user)
      key = user1.api_key
      create_list(:favorite, 3, user: user1)

      get "/api/v1/favorites?api_key=#{key}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      happy_response = JSON.parse(response.body, symbolize_names: true)

      expect(happy_response).to be_a(Hash)
      expect(happy_response).to have_key(:data)
      expect(happy_response[:data]).to be_an(Array)
      expect(happy_response[:data].count).to eq(3)
      expect(happy_response[:data][0]).to have_key(:id)
      expect(happy_response[:data][0][:id]).to be_a(String)
      expect(happy_response[:data][0]).to have_key(:type)
      expect(happy_response[:data][0][:type]).to be_a(String)
      expect(happy_response[:data][0][:type]).to eq("favorite")
      expect(happy_response[:data][0]).to have_key(:attributes)
      expect(happy_response[:data][0][:attributes]).to be_a(Hash)
      expect(happy_response[:data][0][:attributes]).to have_key(:recipe_title)
      expect(happy_response[:data][0][:attributes][:recipe_title]).to be_a(String)
      expect(happy_response[:data][0][:attributes]).to have_key(:recipe_link)
      expect(happy_response[:data][0][:attributes][:recipe_link]).to be_a(String)
      expect(happy_response[:data][0][:attributes]).to have_key(:country)
      expect(happy_response[:data][0][:attributes][:country]).to be_a(String)
      expect(happy_response[:data][0][:attributes]).to have_key(:created_at)
      expect(happy_response[:data][0][:attributes][:created_at]).to be_a(String)
    end

    it "returns an empty array if users have not favorited any recipes" do
      user1 = create(:user)
      key = user1.api_key

      get "/api/v1/favorites?api_key=#{key}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      happy_response = JSON.parse(response.body, symbolize_names: true)

      expect(happy_response).to be_a(Hash)
      expect(happy_response).to have_key(:data)
      expect(happy_response[:data]).to be_an(Array)
      expect(happy_response[:data]).to eq([])
    end
  end

  describe "sad paths" do
    it "returns an error if the API key is invalid" do
      
      user1 = create(:user)
      create_list(:favorite, 3, user: user1)

      get "/api/v1/favorites?api_key=jgn983hy48thw9begh98h4539h4"

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      sad_response = JSON.parse(response.body, symbolize_names: true)
      expect(sad_response).to have_key(:error)
    end
  end
end
