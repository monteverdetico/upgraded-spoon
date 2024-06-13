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

    it 'is invalid without ingredients' do
      expect(build(:recipe, ingredients: '')).not_to be_valid
    end

    it 'is invalid without an image_url' do
      expect(build(:recipe, image_url: '')).not_to be_valid
    end

    it 'is invalid if cook_time is less than 1' do
      expect(build(:recipe, cook_time: 0)).not_to be_valid
    end

    it 'is invalid if less than 1' do
      expect(build(:recipe, cook_time: 0)).not_to be_valid
    end

    describe 'ratings' do
      it 'is invalid if less than 0' do
        expect(build(:recipe, ratings: -1)).not_to be_valid
      end

      it 'is invalid if greater than 10' do
        expect(build(:recipe, ratings: 11)).not_to be_valid
      end
    end
  end
end
