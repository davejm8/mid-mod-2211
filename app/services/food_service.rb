class FoodService
  def self.get_food_data(food)
    response = conn.get("/fdc/v1/foods/search?ingredients=#{food}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
      faraday.params['api_key'] = ENV['FDB_KEY']
    end
  end
end