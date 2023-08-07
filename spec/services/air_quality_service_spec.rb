require "rails_helper"

RSpec.describe "recipe service" do 
  it "returns air quality information for a given city" do 
    search = AirQualityService.new.aq_search("Paris")

    expect(search).to be_a(Hash)
    expect(search).to have_key(:CO)
    expect(search[:CO]).to be_a(Hash)
    expect(search[:CO]).to have_key(:concentration)
    expect(search[:CO][:concentration]).to be_a(Float)
    
    expect(search).to have_key(:"PM2.5")
    expect(search[:"PM2.5"]).to be_a(Hash)
    expect(search[:"PM2.5"]).to have_key(:concentration)
    expect(search[:"PM2.5"][:concentration]).to be_a(Float) 
    
    expect(search).to have_key(:overall_aqi)
    expect(search[:overall_aqi]).to be_an(Integer)
  end
end
