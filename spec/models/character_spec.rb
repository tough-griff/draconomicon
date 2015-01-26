# == Schema Information
#
# Table name: characters
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  name            :string           default(""), not null
#  slug            :string           not null
#  class_and_level :text
#  background      :string
#  player_name     :string
#  race            :string
#  alignment       :string           default("True Neutral"), not null
#  experience      :integer          default("0")
#  age             :integer
#  height          :string
#  weight          :string
#  eyes            :string
#  skin            :string
#  hair            :string
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_characters_on_user_id  (user_id)
#

require "rails_helper"

RSpec.describe Character do
  let(:user) { create(:user) }
  let(:character) { create(:character, user: user) }

  subject { character }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:slug) }
  it { is_expected.to respond_to(:class_and_level) }
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

  it { is_expected.to belong_to(:user) }
  it { is_expected.to respond_to(:user) }

  describe "#user" do
    specify { expect(subject.user).to eq(user) }
  end

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:alignment) }
  it do
    is_expected.to validate_inclusion_of(:alignment)
      .in_array(["Lawful Good", "Neutral Good", "Chaotic Good",
                 "Lawful Neutral", "True Neutral", "Chaotic Neutral",
                 "Lawful Evil", "Neutral Evil", "Chaotic Evil"])
  end
end
