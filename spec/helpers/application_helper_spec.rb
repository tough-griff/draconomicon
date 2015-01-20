require "rails_helper"

RSpec.describe ApplicationHelper do
  before { allow(self).to receive(:current_page?).and_return(false) }

  describe "#nav_link_to" do
    it "returns the correct link" do
      expect(self).to receive(:link_to).with("text", "url", class: "class")
      nav_link_to("text", "url", class: "class")
    end

    context "current_page? false" do
      it "wraps without the 'active' class" do
        expect(self).to receive(:content_tag).with(:li, class: "nav-link")
        nav_link_to("text", "url", class: "class")
      end
    end

    context "current_page? true" do
      before { allow(self).to receive(:current_page?).and_return(true) }

      it "wraps with the 'active' class" do
        expect(self).to receive(:content_tag).with(:li, class: "nav-link active")
        nav_link_to("text", "url", class: "class")
      end
    end
  end
end
