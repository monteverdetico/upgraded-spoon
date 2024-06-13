# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.integer :cook_time, null: false
      t.integer :prep_time, null: false
      t.text :ingredients, null: false
      t.integer :ratings, null: false
      t.string :image_url, null: false
      t.string :category

      t.timestamps
    end
  end
end
