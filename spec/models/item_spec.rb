# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  character_id :integer          not null
#  name         :string           default(""), not null
#  cost         :string
#  weight       :string
#  quantity     :integer
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_items_on_character_id  (character_id)
#

require "rails_helper"

RSpec.describe Item do
  subject { build(:item) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:cost) }
  it { is_expected.to respond_to(:weight) }
  it { is_expected.to respond_to(:quantity) }
  it { is_expected.to respond_to(:description) }

  it { is_expected.to belong_to(:character) }
  it { is_expected.to respond_to(:character) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of("name") }
end
