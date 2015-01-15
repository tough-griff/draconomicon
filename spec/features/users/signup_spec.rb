require "rails_helper"

RSpec.feature "Signing up" do
  background { visit new_user_registration_path }

  scenario "with invalid information" do
    expect do
      fill_form_and_submit(:user, attributes_for(:user, :invalid))
    end.not_to change(User, :count)
  end

  scenario "with valid information" do
    expect do
      fill_form_and_submit(:user, attributes_for(:user))
    end.to change(User, :count).by(1)

    expect(page).to have_selector("div.flash.notice", text: "Welcome!")
    expect(page).to have_link("Sign out", href: destroy_user_session_path)
  end
end
