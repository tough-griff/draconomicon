require "rails_helper"

RSpec.feature "Catchall route" do
  scenario "visiting a page that doesn't exist" do
    visit "fake"

    expect(current_path).to eq(root_path)
    expect(page).to have_selector("div.flash.notice", text: "Sorry")
  end
end
