require "rails_helper"

RSpec.feature "Welcome Page", type: :feature do
  it "can visit the welcome page" do
    visit root_path

    expect(current_path).to eq(root_path)

    expect(page).to have_link("Ingredient Search")
    expect(page).to have_field(:q)
    expect(page).to have_button("Search")
  end

  it "can search for foods" do
    visit root_path

    fill_in :q, with: "sweet potatoes"
    click_button "Search"

    expect(current_path).to eq(foods_path)
  end
end
