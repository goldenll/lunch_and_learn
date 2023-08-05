module Api
  module V1
    class RecipesController < ApplicationController
      def index
        @recipes = RecipeFacade.new.get_recipes(params[:country])
        render json: RecipeSerializer.new(@recipes)
      end
    end
  end
end
