require "rails_helper"

RSpec.describe LearningResource do 
  it "exists and has attributes" do 
    video_data = {
      :snippet=> {
        :title=>"The history of Canada explained in 20 minutes.",
      },
      :id=> {
        :videoId=>"123456789",
      }
    }
    photo_data = {
      :alt_description=>"Sunset helicopter tour over downtown Toronto",
      :urls=> {
        :raw=>"https://images.unsplash.com/photo-1517935706615-",
      }
    }
    video = video_data
    images = photo_data

    lr = LearningResource.new("Canada", Video.new(video_data), Photo.new(photo_data))
    
    expect(lr).to be_a(LearningResource)
    expect(lr.country).to eq("Canada")
    expect(lr.video).to be_a(Video)
    expect(lr.images).to be_a(Photo)
  end
end
