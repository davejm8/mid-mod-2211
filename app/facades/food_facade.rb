class FoodFacade

  def self.get_food_data(food)
    results = FoodService.get_food_data(food)[:foods]
    results.map do |result|
      Food.new(result)
    end
  end

  def self.get_total_hits(food)
    FoodService.get_food_data(food)[:totalHits]
  end
end