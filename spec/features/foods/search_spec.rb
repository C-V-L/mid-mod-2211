require 'rails_helper'

RSpec.describe 'Food Search' do
  describe 'As a user' do
    it 'I can search for foods by ingredient' do
      visit root_path

      fill_in :q, with: 'sweet potatoes'
      click_on 'Search'

      expect(current_path).to eq(foods_path)
      expect(page).to have_content('Total Number of Results: 51270')
      expect(page).to have_css('.food', count: 10)

      within(first('.food')) do
        expect(page).to have_content('Description: SWEET POTATOES')
        expect(page).to have_content('GTIN/UPC Code: 8901020020844')
        expect(page).to have_content('Brand Owner: NOT A BRANDED ITEM')
        expect(page).to have_content('Ingredients: SWEET POTATOES.')
      end
    end
  end
end