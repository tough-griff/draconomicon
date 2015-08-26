# == Schema Information
#
# Table name: character_classes
#
#  id           :integer          not null, primary key
#  name         :string           default(""), not null
#  abbreviation :string(3)        default(""), not null
#  slug         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_character_classes_on_slug  (slug) UNIQUE
#

require "rails_helper"

RSpec.describe CharacterClass, type: :model do
  subject { build(:character_class) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:abbreviation) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:abbreviation) }
  it { is_expected.to validate_uniqueness_of(:abbreviation) }
  it { is_expected.to validate_length_of(:abbreviation).is_equal_to(3) }
  it do
    is_expected.to allow_value("bbn", "rog", "wiz", "Ftr", "MNK")
      .for(:abbreviation)
  end
  it do
    is_expected.not_to allow_value("Barb", "monk", "LOCK")
      .for(:abbreviation)
  end

  it "converts all abbreviations to lower case" do
    subject.abbreviation = "XYZ"
    subject.save!
    expect(subject.abbreviation).to eq("xyz")
  end
end
