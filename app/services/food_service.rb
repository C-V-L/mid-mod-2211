class FoodService
  def self.conn
    Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
      faraday.params['api_key'] = ENV['FOOD_API_KEY']
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search(search_term)
    get_url("/fdc/v1/foods/search?query=#{search_term}&api_key=#{ENV['api_key']}&sortOrder=asc")
  end
end