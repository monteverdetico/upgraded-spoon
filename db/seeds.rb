# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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
