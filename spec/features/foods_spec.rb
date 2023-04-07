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

    expect(page).to have_content('Total Results: 44128')
  end
end