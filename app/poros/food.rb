class Food
  attr_reader :description, :gtin_upc, :brand_owner, :ingredients

  def initialize(data)
    @description = data[:description]
    @gtin_upc = data[:gtinUpc]
    @brand_owner = data[:brandOwner]
    @ingredients = data[:ingredients]
  end
end