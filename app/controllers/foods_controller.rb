class FoodsController < ApplicationController
  def index
    @search_food = params[:q]
    @results = FoodFacade.get_total_hits(@search_food)
    @foods = FoodFacade.get_food_data(@search_food).take(10)
  end
end