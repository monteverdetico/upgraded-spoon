# frozen_string_literal: true

class AddRecipeUniqueConstraint < ActiveRecord::Migration[7.1]
  def change
    add_index :recipes, %i[title author_id], unique: true
  end
end
