require "rails_helper"

RSpec.describe "add favorites", type: :request do
  describe "happy paths" do
    it "adds recipes to a favorited list for a particular user" do
      @user1 = create(:user, api_key: "jgn983hy48thw9begh98h4539h4" )

      params = {
        "api_key": @user1.api_key,
        "country": "thailand",
        "recipe_link": "https://www.tastingtable.com/.....",
        "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post "/api/v1/favorites", params: params

      expect(response).to be_successful
      expect(response.status).to eq(201)
      happy_response = JSON.parse(response.body, symbolize_names: true)

      expect(happy_response).to be_a(Hash)
      expect(happy_response).to have_key(:success)
      expect(happy_response[:success]).to be_a(String)
      expect(happy_response[:success]).to eq("Favorite added successfully")
    end
  end

  # describe "sad paths" do
    # xit "returns an error if the API key is invalid" do
      
      # user1 = create(:user, api_key: "jgn983hy48thw9begh98h4539h4" )

      # params = {
      #   "api_key": "1234567890",
      #   "country": "thailand",
      #   "recipe_link": "https://www.tastingtable.com/.....",
      #   "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
      # }

      # post "/api/v1/favorites", params: params

    #   expect(response).to_not be_successful
    #   expect(response.status).to eq(401)
    #   sad_response = JSON.parse(response.body, symbolize_names: true)
    #   expect(sad_response).to have_key(:error)
    # end
  # end
end
