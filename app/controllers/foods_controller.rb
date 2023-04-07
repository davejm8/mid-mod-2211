class FoodsController < ApplicationController
  def index
    search_food = params[:q]

    conn = Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
      faraday.params['api_key'] = ENV['FDB_KEY']
    end

    response = conn.get("/fdc/v1/search?query=#{search_food}&pageSize=10")

    payload = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end
end