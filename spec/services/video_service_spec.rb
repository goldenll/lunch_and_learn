require "rails_helper"

RSpec.describe "video service" do 
  xit "returns videos ", :vcr do 
    videos = VideoService.new.video_search("Canada")
    video1 = videos[:items].first

    expect(videos).to be_a(Hash)
    expect(videos[:pageInfo][:totalResults]).to be_an(Integer)
    expect(videos).to have_key(:items)
    expect(videos[:items]).to be_an(Array)
    expect(videos[:items].first).to be_a(Hash)
    expect(video1[:snippet]).to have_key(:title)
    expect(video1[:snippet][:title]).to be_a(String)
    expect(video1).to have_key(:id)
    expect(video1[:id]).to be_a(Hash)
    expect(video1[:id]).to have_key(:videoId)
    expect(video1[:id][:videoId]).to be_a(String)
  end
end
