require "rails_helper"

RSpec.describe Photo do 
  it "exists and has attributes" do 
    data = {
      :alt_description=>"Sunset helicopter tour over downtown Toronto",
      :urls=> {
        :raw=>"https://images.unsplash.com/photo-1517935706615-",
      }
    }
    
    photo = Photo.new(data)

    expect(photo).to be_a(Photo)
    expect(photo.alt_tag).to eq("Sunset helicopter tour over downtown Toronto")
    expect(photo.url).to eq("https://images.unsplash.com/photo-1517935706615-")
  end
end
