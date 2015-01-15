require "rails_helper"

RSpec.feature "Deleting a user" do
  given(:user) { create(:user) }

  background do
    sign_in_manual user
    visit edit_user_registration_path
  end

  scenario "is successful" do
    expect { click_link "Cancel your account" }.to change(User, :count).by(-1)
  end
end
