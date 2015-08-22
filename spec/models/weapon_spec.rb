# == Schema Information
#
# Table name: weapons
#
#  id             :integer          not null, primary key
#  character_id   :integer
#  name           :string           default(""), not null
#  category       :string           default("simple"), not null
#  classification :string           default("melee"), not null
#  cost           :string
#  attack_bonus   :integer
#  damage         :string
#  damage_type    :string
#  weight         :string
#  properties     :text
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_weapons_on_character_id  (character_id)
#

require "rails_helper"

RSpec.describe Weapon do
  subject { build(:weapon) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:category) }
  it { is_expected.to respond_to(:classification) }
  it { is_expected.to respond_to(:cost) }
  it { is_expected.to respond_to(:attack_bonus) }
  it { is_expected.to respond_to(:damage) }
  it { is_expected.to respond_to(:damage_type) }
  it { is_expected.to respond_to(:weight) }
  it { is_expected.to respond_to(:properties) }
  it { is_expected.to serialize(:properties).as(Array) }
  it { is_expected.to respond_to(:description) }

  it { is_expected.to belong_to(:character) }
  it { is_expected.to respond_to(:character) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:category) }
  it do
    is_expected.to validate_inclusion_of(:category)
      .in_array(%w(simple martial))
  end
  it { is_expected.to validate_presence_of(:classification) }
  it do
    is_expected.to validate_inclusion_of(:classification)
      .in_array(%w(melee ranged))
  end
end
