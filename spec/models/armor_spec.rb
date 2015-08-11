# == Schema Information
#
# Table name: armors
#
#  id                   :integer          not null, primary key
#  character_id         :integer          not null
#  name                 :string           default(""), not null
#  category             :string           default("Light Armor"), not null
#  cost                 :string
#  armor_class          :integer
#  minimum_str          :integer
#  stealth_disadvantage :boolean
#  weight               :string
#  description          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_armors_on_character_id  (character_id)
#

require "rails_helper"

RSpec.describe Armor do
  subject { create(:armor) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:category) }
  it { is_expected.to respond_to(:cost) }
  it { is_expected.to respond_to(:armor_class) }
  it { is_expected.to respond_to(:minimum_str) }
  it { is_expected.to respond_to(:stealth_disadvantage?) }
  it { is_expected.to respond_to(:weight) }
  it { is_expected.to respond_to(:description) }

  it { is_expected.to belong_to(:character) }
  it { is_expected.to respond_to(:character) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:category) }
  it do
    is_expected.to validate_inclusion_of(:category)
      .in_array(["Light Armor", "Medium Armor", "Heavy Armor", "Shield"])
  end
end
