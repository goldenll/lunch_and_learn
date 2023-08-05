require "rails_helper"

RSpec.describe "country service" do 
  it "selects a random country", :vcr do 
    country = CountryService.new.random_country

    expect(country).to be_a(Hash)
    expect(country).to have_key(:name)
    expect(country[:name]).to be_a(Hash)
    expect(country[:name]).to have_key(:common)
    expect(country[:name][:common]).to be_a(String)
  end
end
