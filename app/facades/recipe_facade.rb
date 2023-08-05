class RecipeFacade
  def get_recipes(country)
    service = RecipeService.new
    request = service.recipe_search(country)
    recipes = request[:hits].map do |data|
      Recipe.new(data, country)
    end
  end
end
