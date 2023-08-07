require "rails_helper"

RSpec.describe CountryFacade do 
  # it "returns a random country" do 
  #   country = CountryFacade.new.get_country

  #   expect(country).to be_a(Country)
  #   expect(country.name).to be_a(String)
  #   expect(country.capital).to be_a(String)
  # end

  it "returns info for a given country" do 
    country = CountryFacade.new.get_country_by_search("Canada")

    expect(country).to be_a(Country)
    expect(country.name).to be_a(String)
    expect(country.capital).to be_a(String)
  end
end
