require "rails_helper"

RSpec.describe "photo service" do 
  it "returns a list of photos by search term", :vcr do 
    search = PhotoService.new.photo_search("Canada")
    photo1 = search[:results].first

    expect(search).to be_a(Hash)
    expect(search).to have_key(:total)
    expect(search[:total]).to be_an(Integer)
    expect(search).to have_key(:results)
    expect(search[:results]).to be_an(Array)
    expect(search[:results].first).to be_a(Hash)
    expect(photo1).to have_key(:alt_description)
    expect(photo1[:alt_description]).to be_a(String)
    expect(photo1).to have_key(:urls)
    expect(photo1[:urls]).to be_a(Hash)
    expect(photo1[:urls]).to have_key(:raw)
    expect(photo1[:urls][:raw]).to be_a(String)
  end
end
