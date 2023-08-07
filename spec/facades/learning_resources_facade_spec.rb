require "rails_helper"

RSpec.describe LearningResourceFacade do 
  it "returns a video and photos related to a given country" do 
    lr = LearningResourceFacade.new.get_resources("Canada")

    expect(lr).to be_a(LearningResource)
    expect(lr.id).to eq("null")
    expect(lr.country).to eq("Canada")
  end
end
