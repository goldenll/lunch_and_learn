require "rails_helper"

RSpec.describe RecipeFacade do 
  xit "returns recipes for a given country" do 
    recipes = RecipeFacade.new.get_recipes("Canada")

    expect(recipes).to be_a(Array)
    expect(recipes.first).to be_a(Recipe)
    expect(recipes.first.title).to be_a(String)
    expect(recipes.first.url).to be_a(String)
    expect(recipes.first.country).to be_a(String)
    expect(recipes.first.country).to eq("Canada")
    expect(recipes.first.image).to be_a(String)
  end
end

# Add configuration values here, as shown below.
#
# pusher_app_id: "2954"
# pusher_key: 7381a978f7dd7f9a1117
# pusher_secret: abdc3b896a0ffb85d373
# stripe_api_key: sk_test_2J0l093xOyW72XUYJHE4Dv2r
# stripe_publishable_key: pk_test_ro9jV5SNwGb1yYlQfzG17LHK
#
# production:
#   stripe_api_key: sk_live_EeHnL644i6zo4Iyq4v1KdV9H
#   stripe_publishable_key: pk_live_9lcthxpSIHbGwmdO941O1XVU

UNSPLASH_KEY: KXGPdzW7pghAeWUVP5oxhZcLCiDad1VPN_tBNIC8p80
EDAMAM_KEY: 9d98dc098456ca5d91649b810c20ba49
EDAMAM_APP_ID: e855c222
YOUTUBE_KEY: AIzaSyD-2lbKNo7EEBcNxaImmRx-bydEoM1z7RA