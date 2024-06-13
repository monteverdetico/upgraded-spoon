# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @pagy, @recipes = pagy(recipes)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipes
    if params[:query].blank?
      Recipe.all
    else
      Recipe.search(params[:query])
    end
  end
end
