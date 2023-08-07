require "rails_helper"

RSpec.describe AirQualityFacade do 
  it "returns air quality data for a given city" do 
    aq = AirQualityFacade.new.get_aq("Paris")

    expect(aq).to be_an(AirQuality)
    expect(aq.city).to be_a(String)
    expect(aq.city).to eq("Paris")
    expect(aq.aqi).to be_an(Integer)
    expect(aq.pm25_concentration).to be_a(Float)
    expect(aq.co_concentration).to be_a(Float)
  end
end
