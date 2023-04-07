require 'rails_helper'
require './app/services/food_service'

RSpec.describe FoodService do

  it 'can get food data' do
    service = FoodService

    results = service.get_food_data('sweet potatoes')

    expect(results).to be_a(Hash)
    expect(results[:foods]).to be_an(Array)
    expect(results[:foods].first).to have_key(:description)
    expect(results[:foods].first).to have_key(:gtinUpc)
    expect(results[:foods].first).to have_key(:brandOwner)
    expect(results[:foods].first).to have_key(:ingredients)
  end
end