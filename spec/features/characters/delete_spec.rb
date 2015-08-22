require "rails_helper"

RSpec.feature "Deleting a character" do
  given(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given!(:character) { create(:character, user: user) }

  it { skip "needs to be written" }
end
