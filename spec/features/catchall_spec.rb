require "rails_helper"

RSpec.feature "Catchall route" do
  scenario "visiting a page that doesn't exist" do
    visit "fake_route_that_definitely_doesnt_exist"

    expect(current_path).to eq(root_path)
  end
end
