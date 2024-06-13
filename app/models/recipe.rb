# frozen_string_literal: true

class Recipe < ApplicationRecord
  include PgSearch::Model

  validates :image_url, :ingredients, presence: true

  validates :cook_time, comparison: { greater_than_or_equal_to: 0 }
  validates :prep_time, comparison: { greater_than_or_equal_to: 0 }
  validates :ratings, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  validates :title, presence: true, uniqueness: { scope: :author }

  belongs_to :author

  pg_search_scope :search, against: :ingredients, using: { tsearch: { dictionary: 'english' } }
end
