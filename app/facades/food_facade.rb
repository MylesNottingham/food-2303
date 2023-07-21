require "./services/food_service"
require "./app/models/poros/food"

class FoodFacade
  attr_reader :query

  def initialize(params)
    @query = params[:q]
  end

  def total_hits
    FoodService.food_search(@query)[:totalHits]
  end

  def matching_foods
    FoodService.food_search(@query)[:foods][0..9].map do |food|
      Food.new(food)
    end
  end
end
