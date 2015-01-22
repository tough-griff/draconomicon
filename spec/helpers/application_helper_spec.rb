require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "#nav_link_to" do
    context "current_page? false" do
      before { allow(self).to receive(:current_page?).and_return(false) }

      it "does not add the 'active' class" do
        expect(self).to receive(:link_to).with("text", "url", nil)
        nav_link_to("text", "url")
      end
    end

    context "current_page? true" do
      before { allow(self).to receive(:current_page?).and_return(true) }

      it "adds the 'active' class" do
        expect(self).to receive(:link_to).with("text", "url", class: "active")
        nav_link_to("text", "url")
      end
    end
  end
end
