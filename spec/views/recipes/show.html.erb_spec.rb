# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes/show.html.erb', type: :view do
  let(:recipe) { create(:recipe) }

  before do
    assign(:recipe, recipe)
  end

  it 'displays the recipe' do
    render

    expect(rendered).to match(/#{recipe.title}/)
    expect(rendered).to match(/#{recipe.cook_time}/)
    expect(rendered).to match(/#{recipe.prep_time}/)
    expect(rendered).to match(/#{recipe.ratings}/)
    expect(rendered).to match(/#{recipe.author.name}/)
    expect(rendered).to match(/1 egg/)
  end

  it 'displays a link back' do
    render

    expect(rendered).to match(%r{/recipes})
  end
end
