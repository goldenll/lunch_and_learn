require "rails_helper"

RSpec.describe PhotoFacade do 
  it "returns photos related to a given country" do 
    photos = PhotoFacade.new.get_photos("Canada")

    expect(photos).to be_a(Array)
    expect(photos.count).to eq(10)
    expect(photos.first).to be_a(Photo)
    expect(photos.first.alt_tag).to be_a(String)
    expect(photos.first.url).to be_a(String)
  end
end
