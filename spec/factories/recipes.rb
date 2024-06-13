# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    title { 'MyString' }
    cook_time { 1 }
    prep_time { 1 }
    ingredients { 'MyText' }
    ratings { 1 }
    image_url { 'MyString' }
    category { 'MyString' }
  end
end
