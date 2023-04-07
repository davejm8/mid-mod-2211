require 'rails_helper'

RSpec.describe Food do
  it 'exists' do
    data = {
    :description=>"SWEET POTATOES",
    :gtinUpc=>"8901020020844",
    :brandOwner=>"NOT A BRANDED ITEM",
    :ingredients=>"ORGANIC SWEET POTATOES."
  }

  food = Food.new(data)

  expect(food).to be_a(Food)
  expect(food.description).to eq("SWEET POTATOES")
  expect(food.gtin_upc).to eq("8901020020844")
  expect(food.brand_owner).to eq("NOT A BRANDED ITEM")
  expect(food.ingredients).to eq("ORGANIC SWEET POTATOES.")
  end
end