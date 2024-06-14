# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :view do
  before do
    assign(:recipes, [create(:recipe, title: 'Tasty'), create(:recipe, title: 'Spicy')])
    assign(:pagy, double('Pagy', pages: 1))
  end

  it 'displays a list of recipes' do
    render

    expect(rendered).to match(/Tasty/)
    expect(rendered).to match(/Spicy/)
  end

  it 'includes a search field' do
    render

    expect(render).to match(%r{form action="/recipes" accept-charset="UTF-8" method="get"})
    expect(render).to match(/Enter the ingredients you have and we will find you recipes/)
    expect(render).to match(/input placeholder="chicken, cheese" type="text" name="query" id="query"/)
    expect(render).to match(/input type="submit" value="Search"/)
  end
end
