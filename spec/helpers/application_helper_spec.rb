require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "#tooltip" do
    subject { tooltip("label", direction: :s) { "body" } }

    it "creates a div tag" do
      is_expected.to match(%r{<div.*>.*</div>})
    end

    it "includes the correct class" do
      is_expected.to match('class="tooltipped tooltipped-s"')
    end

    it "includes the correct label" do
      is_expected.to match('aria-label="label"')
    end
  end
end
