require "rails_helper"

RSpec.describe "user registration", type: :request do
  describe "happy paths" do
    it "returns name, email, and api_key" do
      post "/api/v1/users"

      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to be_a(Hash)
      expect(user).to have_key(:data)
      expect(user[:data]).to be_a(Hash)
      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to eq("user")
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_an(Integer)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes]).to have_key(:name)
      expect(user[:data][:attributes][:name]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:apid_key)
      expect(user[:data][:attributes][:apid_key]).to be_a(String)
    end
  end

  # A successful request creates a user in your database, creates a password digest, and generates a unique api key associated with that user, with a 201 status code.
  # Use bcrypt to authenticate and create a password digest for a new user.
  # Email addresses must be unique. If a unique email address is not used for registration, an appropriate error message should be returned in the response.
  # If passwords do not match, an appropriate error message should be returned in the response.



  
  # describe "sad paths" do
    # it "if no images are found, the image key should point to an empty object" do
    #   get "/api/v1/learning_resources?country=Nameofcountry"

    #   expect(response).to be_successful

    #   lr = JSON.parse(response.body, symbolize_names: true)

    #   expect(lr).to have_key(:data)
    #   expect(lr[:data]).to have_key(:attributes)
    #   expect(lr[:data][:attributes]).to have_key(:id)
    #   expect(lr[:data][:attributes]).to have_key(:country)
    #   expect(lr[:data][:attributes][:country]).to eq("Nameofcountry")
    #   expect(lr[:data][:attributes]).to have_key(:images)
    #   expect(lr[:data][:attributes][:images]).to be_an(Array)
    #   expect(lr[:data][:attributes][:images]).to eq([])
    # end
  # end
end
