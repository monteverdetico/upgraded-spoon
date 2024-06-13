# frozen_string_literal: true

class AddForeignKeyToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_reference :recipes, :author, foreign_key: true
  end
end
