# == Schema Information
#
# Table name: characters
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string           default(""), not null
#  slug         :string           not null
#  class_levels :text
#  background   :string
#  player_name  :string
#  race         :string
#  alignment    :string           default("True Neutral"), not null
#  experience   :integer          default(0)
#  age          :integer
#  height       :string
#  weight       :string
#  eyes         :string
#  skin         :string
#  hair         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_characters_on_user_id  (user_id)
#

require "rails_helper"

RSpec.describe Character do
  subject { create(:character) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:slug) }
  it { is_expected.to respond_to(:class_levels) }
  it { is_expected.to serialize(:class_levels).as(Hash) }
  it { is_expected.to respond_to(:background) }
  it { is_expected.to respond_to(:player_name) }
  it { is_expected.to respond_to(:race) }
  it { is_expected.to respond_to(:alignment) }
  it { is_expected.to respond_to(:experience) }
  it { is_expected.to respond_to(:age) }
  it { is_expected.to respond_to(:height) }
  it { is_expected.to respond_to(:weight) }
  it { is_expected.to respond_to(:eyes) }
  it { is_expected.to respond_to(:skin) }
  it { is_expected.to respond_to(:hair) }
  it { is_expected.to respond_to(:image_url) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to respond_to(:user) }

  it { is_expected.to have_many(:weapons) }
  it { is_expected.to respond_to(:weapons) }
  it { is_expected.to have_many(:armors) }
  it { is_expected.to respond_to(:armors) }
  it { is_expected.to have_many(:items) }
  it { is_expected.to respond_to(:items) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:alignment) }
  it do
    is_expected.to validate_inclusion_of(:alignment)
      .in_array(["Lawful Good", "Neutral Good", "Chaotic Good",
                 "Lawful Neutral", "True Neutral", "Chaotic Neutral",
                 "Lawful Evil", "Neutral Evil", "Chaotic Evil"])
  end

  describe "#character_level" do
    before { subject.class_levels = { rgr: 7, rog: 3, ftr: 2 } }

    specify { expect(subject.character_level).to eq(12) }
  end

  # Tests both #description and #to_s
  describe "#to_s" do
    before do
      subject.name = "Havel"
      subject.alignment = "Chaotic Neutral"
      subject.race = "Human"
      subject.class_levels = { ftr: 10, clr: 3 }
    end

    specify { expect(subject.to_s).to eq("Havel (CN Human Ftr 10/Clr 3)") }

    context "with blank race" do
      before { subject.race = "" }

      specify { expect(subject.to_s).to eq("Havel") }
    end

    context "with blank class and level" do
      before { subject.class_levels = {} }

      specify { expect(subject.to_s).to eq("Havel") }
    end
  end
end
