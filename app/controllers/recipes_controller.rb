# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @pagy, @recipes = pagy(recipes)
  end

  def show
    @recipe = Recipe.preload(:author).find(params[:id])
  end

  private

  def recipes
    if params[:query].blank?
      Recipe.all.order(ratings: :desc)
    else
      Recipe.search(params[:query])
    end
  end
end
