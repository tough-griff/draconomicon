RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end

# signs in a user manually
def sign_in_manual(user)
  visit new_user_session_path
  fill_in "user_email",    with: user.email
  fill_in "user_password", with: user.password
  click_button "Sign in"
end
