module RecipesHelper
  def ingredients(recipe)
    JSON.parse(recipe.ingredients)
  end

  def back_link(referer)
    if referer.nil?
      link_to 'All Recipes', recipes_path
    else
      link_to 'Back to Search', :back
    end
  end
end
