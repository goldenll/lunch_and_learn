require "rails_helper"

RSpec.describe VideoFacade do 
  it "returns videos related to a given country" do 
    videos = VideoFacade.new.get_videos("Canada")

    expect(videos).to be_a(Array)
    expect(videos.first).to be_a(Video)
    expect(videos.first.title).to be_a(String)
    expect(videos.first.video_id).to be_a(String)
  end
end
