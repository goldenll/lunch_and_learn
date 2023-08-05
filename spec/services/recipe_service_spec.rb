require "rails_helper"

RSpec.describe "recipe service" do 
  xit "returns a list of recipes", :vcr do 
    search = RecipeService.new.recipe_search("Canada")
    recipe1 = search[:hits].first[:recipe]

    expect(search).to be_a(Hash)
    expect(search).to have_key(:count)
    expect(search[:count]).to be_an(Integer)
    expect(search[:count]).to eq(293)
    expect(search).to have_key(:hits)
    expect(search[:hits]).to be_an(Array)
    expect(search[:hits].first).to be_a(Hash)
    expect(search[:hits].first).to have_key(:recipe)
    expect(search[:hits].first[:recipe]).to have_key(:label)
    expect(search[:hits].first[:recipe][:label]).to be_a(String)
    expect(search[:hits].first[:recipe][:label]).to eq("Tamarind Beer")
    expect(recipe1[:label]).to be_a(String)
    expect(recipe1[:label]).to eq("Tamarind Beer")
    expect(recipe1).to have_key(:url)
    expect(recipe1[:url]).to be_a(String)
    expect(recipe1[:url]).to eq("https://food52.com/recipes/13186-tamarind-beer")
    expect(recipe1).to have_key(:image)
    expect(recipe1[:image]).to be_a(String)
    expect(recipe1[:image]).to include("amazonaws.com")
  end
end
