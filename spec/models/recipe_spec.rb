# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(build(:recipe)).to be_valid
    end

    it 'is invalid without a title' do
      expect(build(:recipe, title: '')).not_to be_valid
    end

    it 'is invalid without an image_url' do
      expect(build(:recipe, image_url: '')).not_to be_valid
    end

    it 'is invalid if cook_time is less than 0' do
      expect(build(:recipe, cook_time: -1)).not_to be_valid
    end

    it 'is invalid if less than 0' do
      expect(build(:recipe, cook_time: -1)).not_to be_valid
    end

    describe 'ratings' do
      it 'is invalid if less than 0' do
        expect(build(:recipe, ratings: -1)).not_to be_valid
      end

      it 'is invalid if greater than 5' do
        expect(build(:recipe, ratings: 11)).not_to be_valid
      end
    end

    describe 'ingredients' do
      it 'is invalid without ingredients' do
        expect(build(:recipe, ingredients: '')).not_to be_valid
      end

      it 'valid when a JSON array' do
        expect(build(:recipe, ingredients: '["1 egg"]')).to be_valid
      end

      it 'is invalid when a simple string' do
        expect(build(:recipe, ingredients: '1 egg')).not_to be_valid
      end
    end
  end

  describe 'search' do
    let!(:recipe) { create(:recipe, ingredients: '["1 egg", "1oz butter", "salt", "pepper", "chives"]') }

    it 'supports stemming' do
      expect(Recipe.search('eggs')).not_to be_empty
    end

    it 'matches any word' do
      expect(Recipe.search('["1 egg", "5 tomatoes", "1lb beef"]"')).not_to be_empty
    end
  end
end
