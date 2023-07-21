require "rails_helper"

RSpec.feature "Welcome Page", type: :feature do
  it "can visit the welcome page" do
    visit root_path

    expect(current_path).to eq(root_path)
  end
end
