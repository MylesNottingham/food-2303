require "rails_helper"

RSpec.feature "Search Results", type: :feature do
  it "displays the title and total number of hits" do
    query = "sweet potatoes"

    visit root_path

    fill_in :q, with: query
    click_button "Search"

    expect(current_path).to eq(foods_path)

    within("#title") do
      expect(page).to have_content("Search Results for '#{query}'")
      expect(page).to have_content("Total Hits: ")
    end
  end

  it "displays the first 10 foods that match the query" do
    query = "sweet potatoes"

    visit root_path

    fill_in :q, with: query
    click_button "Search"

    within("#query-results") do
      expect(page).to have_content("UPC:")
      expect(page).to have_content("Description:")
      expect(page).to have_content("Brand Owner:")
      expect(page).to have_content("Ingredients:")
    end
  end
end
