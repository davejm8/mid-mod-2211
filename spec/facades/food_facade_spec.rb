require 'rails_helper'
require './app/facades/food_facade'

RSpec.describe FoodFacade do
  let!(:food) { FoodFacade.new }

  it 'exists' do
    expect(food).to be_a(FoodFacade)
  end

  it 'can get food data' do
    results = FoodFacade.get_food_data('sweet potatoes')

    expect(results).to be_a(Array)
    expect(results.first).to be_a(Food)
  end

  it 'can get total hits on a search' do
    results = FoodFacade.get_total_hits('sweet potatoes')

    expect(results).to be_a(Integer)
  end
end