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

FactoryGirl.define do
  factory :character do
    sequence(:name) { |n| "Character #{n}" }
    user

    trait :invalid do
      name ""
    end
  end
end
