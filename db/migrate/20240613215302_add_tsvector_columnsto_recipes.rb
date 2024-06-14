# frozen_string_literal: true

class AddTsvectorColumnstoRecipes < ActiveRecord::Migration[7.1]
  def up
    add_column :recipes, :ingredients_tsv, :virtual, type: :tsvector, as: "to_tsvector('english', ingredients)",
                                                     stored: true
    add_index :recipes, :ingredients_tsv, using: 'gin'

    now = Time.current.to_formatted_s(:db)
    update("UPDATE recipes SET updated_at = '#{now}'")
  end

  def down
    remove_index :recipes, :ingredients_tsv
    remove_column :recipes, :ingredients_tsv
  end
end
