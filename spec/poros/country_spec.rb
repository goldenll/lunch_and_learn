require "rails_helper"

RSpec.describe Country do 
  it "exists and has attributes" do 
    data = [{
      :name=>{
        :common=>"Canada"
      }, 
      :capital=> [
        "Paris"
      ]
    }]
    
    country = Country.new(data)

    expect(country).to be_a(Country)
    expect(country.name).to eq("Canada")
    expect(country.capital).to eq("Paris")
  end
end
