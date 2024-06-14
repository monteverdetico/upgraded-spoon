# frozen_string_literal: true

source_data_path = './db/seed_data/recipes-en.json'

JSON.parse(File.read(source_data_path)).each do |recipe|
  author_name = recipe['author'].presence || 'Unknown'
  author = Author.find_or_create_by!(name: author_name)

  Recipe.find_or_create_by!(title: recipe['title'], author:) do |recipe_record|
    recipe_record.cook_time = recipe['cook_time']
    recipe_record.prep_time = recipe['prep_time']
    recipe_record.image_url = recipe['image']
    recipe_record.ingredients = recipe['ingredients']
    recipe_record.ratings = recipe['ratings']
  end
end
