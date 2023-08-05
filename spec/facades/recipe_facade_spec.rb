require "rails_helper"

RSpec.describe RecipeFacade do 
  it "returns recipes for a given country" do 
    recipes = RecipeFacade.new.get_recipes("Canada")

    expect(recipes).to be_a(Array)
    expect(recipes.first).to be_a(Recipe)
    expect(recipes.first.title).to be_a(String)
    expect(recipes.first.url).to be_a(String)
    expect(recipes.first.country).to be_a(String)
    expect(recipes.first.country).to eq("Canada")
    expect(recipes.first.image).to be_a(String)
  end
end
