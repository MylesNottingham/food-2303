class FoodService
  def self.conn
    Faraday.new(url: "https://api.nal.usda.gov/fdc/v1/foods/") do |faraday|
      faraday.params["api_key"] = ENV["FOOD_API_KEY"]
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.food_search(query)
    get_url("search?query=#{query}")
  end
end
