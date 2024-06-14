# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    author
    title { 'MyString' }
    cook_time { 1 }
    prep_time { 1 }
    ingredients { '["1 egg"]' }
    ratings { 1 }
    image_url { '/apple-touch-icon.png' }
    category { 'MyString' }
  end
end
