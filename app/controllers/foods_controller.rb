class FoodsController < ApplicationController
  def index
    @search_food = params[:q]

    conn = Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
      faraday.params['api_key'] = ENV['FDB_KEY']
    end

    response = conn.get("/fdc/v1/search?pageNumber=1&pageSize=10&ingredients=#{@search_food}")

    payload = JSON.parse(response.body, symbolize_names: true)

    @foods = payload[:foods].map do |food_data|
      Food.new(food_data)
    end
  end
end