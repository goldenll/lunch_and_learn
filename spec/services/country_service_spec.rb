require "rails_helper"

RSpec.describe "country service" do 
  # xit "selects a random country", :vcr do 
  #   country = CountryService.new.random_country

  #   expect(country).to be_a(Hash)
  #   expect(country).to have_key(:name)
  #   expect(country[:name]).to be_a(Hash)
  #   expect(country[:name]).to have_key(:common)
  #   expect(country[:name][:common]).to be_a(String)
  # end

  it "searches for countries by name" do 
    country = CountryService.new.country_search("Canada")

    expect(country).to be_an(Array)
    expect(country[0]).to be_a(Hash)
    expect(country[0]).to have_key(:name)
    expect(country[0][:name]).to be_a(Hash)
    expect(country[0][:name]).to have_key(:common)
    expect(country[0][:name][:common]).to be_a(String)
    expect(country[0]).to have_key(:capital)
    expect(country[0][:capital]).to be_an(Array)
    expect(country[0][:capital][0]).to be_a(String)
    expect(country[0][:capital][0]).to eq("Ottawa")
  end
end
