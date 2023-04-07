require 'rails_helper'

RSpec.describe FoodFacade do
  describe 'instance methods' do
    describe '#total_results' do
      it 'returns the total number of results' do
        facade = FoodFacade.new('sweet potatoes')

        expect(facade.total_results).to eq(51270)
      end
    end

    describe '#food_list' do
      it 'returns a list of 10 foods for a given search' do
        facade = FoodFacade.new('sweet potatoes')
        expect(facade.food_list).to be_an(Array)
        expect(facade.food_list.first).to be_a(Food)
        expect(facade.food_list.count).to eq(10)
      end
    end
  end
end