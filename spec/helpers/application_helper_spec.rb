require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  before { allow(self).to receive(:current_page?).and_return(false) }

  describe "#nav_link_to" do
    let(:link) { nav_link_to("link text", "href") }

    it "returns the correct link" do
      expect(link).to match('<a href="href">link text</a>')
    end

    it "wraps without the 'active' class" do
      expect(link).to match('<li class="nav-link">')
    end

    context "current_page? true" do
      before { allow(self).to receive(:current_page?).and_return(true) }

      let(:active_link) { nav_link_to("link text", "this_page") }

      it "wraps with the 'active' class" do
        expect(active_link).to match('<li class="nav-link active">')
      end
    end
  end
end
