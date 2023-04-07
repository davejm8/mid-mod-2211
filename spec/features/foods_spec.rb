require 'rails_helper'
# As a user,
# When I visit "/"
# And I fill in the search form with "sweet potatoes"
# (Note: Use the existing search form)
# And I click "Search"
# Then I should be on page "/foods"
# Then I should see a total of the number of items returned by the search.
# (sweet potatoes should find more than 30,000 results)
# Then I should see a list of TEN foods that contain the ingredient "sweet potatoes"

# And for each of the foods I should see:
# - The food's GTIN/UPC code
# - The food's description
# - The food's Brand Owner
# - The food's ingredients

RSpec.describe 'Search', type: :feature do
  before :each do
    visit '/'

    fill_in 'q', with: 'sweet potatoes'
    click_on 'Search'
  end

  it 'can search for foods' do
    expect(current_path).to eq('/foods')

    expect(page).to have_content('Here are the first 10 results for sweet potatoes')
  end

  it 'expect page to have total hits' do
    expect(page).to have_content('Total hits: 38114')
  end

  it 'expect page to have food attributes' do

    within '#food-728229015529' do

      expect(page).to have_content('Description: SWEETS MEDLEY')
      expect(page).to have_content('GTIN/UPC code: 728229015529')
      expect(page).to have_content('Brand Owner: The Hain Celestial Group, Inc.')
      expect(page).to have_content('Ingredients: A BLEND OF SWEET POTATOES (SWEET POTATO, PURPLE SWEET POTATO, BATATA), AVOCADO OIL, SEA SALT.')
    end

    within '#food-8809069966485' do
      expect(page).to have_content('Description: SEASONED VEGETABLE POWDER')
      expect(page).to have_content('GTIN/UPC code: 8809069966485')
      expect(page).to have_content('Brand Owner: WANG')
      expect(page).to have_content('Ingredients: VEGETABLE FLAKE: {PURPLE SWEET POTATO FLAKE (PURPLE SWEET POTATO, SWEET POTATO STARCH), POTATO FLAKE (POTATO, SWEET POTATO STARCH), CARROT FLAKE (CARROT), SWEET PUMPKIN FLAKE(SWEET PUMPKIN)}, SMOKED SALMON (SALMON, SALT), DRIED SEAWEED, BROWN RICE OIL, SESAME, ORGANIC SUGAR, SALT.')
    end
  end
end