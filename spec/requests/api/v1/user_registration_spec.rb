require "rails_helper"

RSpec.describe "user registration", type: :request do
  describe "happy paths" do
    it "returns name, email, and api_key" do
      new_user = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "treats4lyf"
      }

      post "/api/v1/users", params: new_user

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to be_a(Hash)
      expect(user).to have_key(:data)
      expect(user[:data]).to be_a(Hash)
      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to eq("user")
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_a(String)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes]).to have_key(:name)
      expect(user[:data][:attributes][:name]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes][:api_key]).to be_a(String)
    end
  end

  describe "sad paths" do
    it "if a unique email address is not used for registration, an appropriate error message should be returned" do
      user1 = create(:user, email: "goodboy@ruffruff.com")

      new_user = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "treats4lyf"
      }

      post "/api/v1/users", params: new_user
      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:email]).to include("has already been taken")
    end

    it "passwords do not match, an appropriate error message should be returned in the response" do
      new_user = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "treatspls"
      }

      post "/api/v1/users", params: new_user
      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:error]).to include("Passwords do not match")
    end
  end
end
