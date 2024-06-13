# frozen_string_literal: true

class Recipe < ApplicationRecord
  validates :image_url, :ingredients, :title, presence: true

  validates :cook_time, comparison: { greater_than: 0 }
  validates :prep_time, comparison: { greater_than: 0 }
  validates :ratings, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  belongs_to :author
end
