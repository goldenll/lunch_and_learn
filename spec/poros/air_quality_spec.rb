require "rails_helper"

RSpec.describe AirQuality do 
  it "exists and has attributes" do 
    data = {
      :CO=> {
        :concentration=> 216.96,
      },
      :"PM2.5"=> {
        :concentration=> 3.15,
      },
      :overall_aqi=> 35 
    }

    aq= AirQuality.new(data, "Paris")

    expect(aq).to be_an(AirQuality)
    expect(aq.city).to eq("Paris")
    expect(aq.aqi).to eq(35)
    expect(aq.pm25_concentration).to eq(3.15)
    expect(aq.co_concentration).to eq(216.96)
  end
end
