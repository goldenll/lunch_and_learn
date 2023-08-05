require "rails_helper"

RSpec.describe Recipe do 
  it "exists and has attributes" do 
    data = {
      :recipe=> {
        :label=>"poutine",
        :url=>"https://www.seriouseats.com/recipes/2013",
        :image=>"https://edamam-product-images.s3.amazonaws.com/"
      }
    }
    
    recipe = Recipe.new(data, "Canada")

    expect(recipe).to be_a(Recipe)
    expect(recipe.title).to eq("poutine")
    expect(recipe.url).to eq("https://www.seriouseats.com/recipes/2013")
    expect(recipe.country).to eq("Canada")
    expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/")
  end
end
