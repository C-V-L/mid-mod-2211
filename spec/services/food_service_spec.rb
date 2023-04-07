require 'rails_helper'

RSpec.describe FoodService do
  describe 'class methods' do
    describe '#search' do
      it 'returns a list of foods' do
        expect(FoodService.search('sweet potatoes')).to be_a(Hash)
        expect(FoodService.search('sweet potatoes')[:foods]).to be_an(Array)
        expect(FoodService.search('sweet potatoes')[:foods].first).to have_key(:gtinUpc) 
        expect(FoodService.search('sweet potatoes')[:foods].first).to have_key(:description)
        expect(FoodService.search('sweet potatoes')[:foods].first).to have_key(:brandOwner)
        expect(FoodService.search('sweet potatoes')[:foods].first).to have_key(:ingredients)
      end
    end
  end
end