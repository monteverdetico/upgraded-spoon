module RecipesHelper
  def ingredients(recipe)
    JSON.parse(recipe.ingredients)
  end
end
