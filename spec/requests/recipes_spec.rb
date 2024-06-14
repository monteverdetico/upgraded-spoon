# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /index' do
    before do
      create(:recipe)
    end

    it 'returns http success' do
      get '/recipes'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let(:recipe) { create(:recipe) }

    it 'returns http success' do
      get "/recipes/#{recipe.to_param}"
      expect(response).to have_http_status(:success)
    end
  end
end
