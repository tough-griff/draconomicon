require "rails_helper"

describe ApplicationHelper, type: :helper do
  let(:title) { full_title("foo")}

  describe "#full_title" do
    it "includes the page title" do
      expect(title).to match(/foo/)
    end

    it "includes the base title" do
      expect(title).to match(/The Draconomicon/)
    end

    it "forms the correct title" do
      expect(title).to eq("The Draconomicon | foo")
    end

    it "does not include a bar for empty page titles" do
      expect(full_title("")).not_to match(/\|/)
    end
  end
end
