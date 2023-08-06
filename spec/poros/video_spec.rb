require "rails_helper"

RSpec.describe Video do 
  it "exists and has attributes" do 
    data = {
      :snippet=> {
        :title=>"The history of Canada explained in 20 minutes.",
      },
      :id=> {
        :videoId=>"123456789",
      }
    }
    
    video = Video.new(data)

    expect(video).to be_a(Video)
    expect(video.title).to eq("The history of Canada explained in 20 minutes.")
    expect(video.video_id).to eq("123456789")
  end
end
