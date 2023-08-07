require "rails_helper"

RSpec.describe "user log in", type: :request do
  describe "happy paths" do
    it "logs in a user with valid credentials" do
      user1 = create(:user, email: "goodboy@ruffruff.com", password: "treats4lyf" )

      login = {
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf"
      }

      post "/api/v1/sessions", params: login

      expect(response).to be_successful
      expect(response.status).to eq(200)
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
    it "returns an error if the email and password do not match" do
      
      user1 = create(:user, email: "goodboy@ruffruff.com", password: "treats4lyf" )

      login = {
        "email": "goodboy@ruffruff.com",
        "password": "treatspls"
      }

      post "/api/v1/sessions", params: login

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      sad_response = JSON.parse(response.body, symbolize_names: true)
      expect(sad_response).to have_key(:error)
    end

    it "returns an error if the email is missing" do
      
      user1 = create(:user, email: "goodboy@ruffruff.com", password: "treats4lyf" )

      login = {
        "email": "goodboy@ruffruff.com",
        "password": "treatspls"
      }

      post "/api/v1/sessions", params: login

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      sad_response = JSON.parse(response.body, symbolize_names: true)
      expect(sad_response).to have_key(:error)
    end

    it "returns an error if the password is missing" do
      
      user1 = create(:user, email: "goodboy@ruffruff.com", password: "treats4lyf" )

      login = {
        "email": "goodboy@ruffruff.com",
        "password": "treatspls"
      }

      post "/api/v1/sessions", params: login

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      sad_response = JSON.parse(response.body, symbolize_names: true)
      expect(sad_response).to have_key(:error)
    end
  end
end
