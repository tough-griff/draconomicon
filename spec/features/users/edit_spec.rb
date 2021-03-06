require "rails_helper"

RSpec.feature "Editing a user" do
  given(:user) { create(:user) }

  background do
    sign_in_manual user
    visit edit_user_registration_path
  end

  scenario "with invalid information" do
    expect do
      fill_form_and_submit(:user, :edit, attributes_for(:user, name: "New Name"))
    end.not_to change(user, :name)

    expect(page).to have_selector("span.error", text: "can't be blank")
    expect(user.name).not_to eq("New Name")
  end

  scenario "with valid information" do
    fill_form_and_submit(:user, :edit, name: "New Name",
                                       email: "new@example.com",
                                       current_password: user.password)
    user.reload

    expect(user.name).to eq("New Name")
    expect(user.email).not_to eq("new@example.com")
    expect(user.unconfirmed_email).to eq("new@example.com")
  end
end
