require "rails_helper"

RSpec.describe UsersHelper do
  let(:user) { build_stubbed(:user) }

  describe "#gravatar_for" do
    subject { gravatar_for(user) }

    it "creates an image tag" do
      is_expected.to match(%r{<img.*/>})
    end

    it "includes the correct alt text" do
      is_expected.to match(user.name)
    end

    it "defaults to size = 52" do
      is_expected.to match(/\?s=52/)
    end

    it "includes a custom size parameter" do
      expect(gravatar_for(user, size: 104)).to match(/\?s=104/)
    end
  end
end
