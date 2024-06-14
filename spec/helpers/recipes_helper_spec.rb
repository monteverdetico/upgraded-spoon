# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesHelper, type: :helper do
  describe 'ingredients' do
    let(:recipe) { build(:recipe) }

    it 'returns a list of ingredients' do
      expect(helper.ingredients(recipe)).to eq(['1 egg'])
    end
  end
end
