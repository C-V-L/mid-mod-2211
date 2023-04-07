class FoodFacade
  def initialize(search_term)
    @search_term = search_term
  end

  def total_results
    results = FoodService.search(@search_term)
    total_results = results[:totalHits]
  end

  def food_list
    foods = FoodService.search(@search_term)
    foods[:foods].first(10).map do |food|
      Food.new(food)
    end
  end
end