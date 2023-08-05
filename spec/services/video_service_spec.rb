require "rails_helper"

RSpec.describe "video service" do 
  it "returns videos ", :vcr do 
    videos = VideoService.new.video_search("Canada")
    video1 = videos[:data].first
require 'pry'; binding.pry
    expect(videos).to be_a(Hash)
    expect(videos).to have_key(:count)
    expect(videos[:count]).to be_an(Integer)
    expect(videos).to have_key(:XX)
    expect(videos[:XX]).to be_an(Array)
  end
end
