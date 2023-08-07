class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country] == "random"
      country = CountryFacade.new.get_country
      @recipes = RecipeFacade.new.get_recipes(country.name)
    else 
      @recipes = RecipeFacade.new.get_recipes(params[:country])
    end
    render json: RecipeSerializer.new(@recipes)
  end
end
