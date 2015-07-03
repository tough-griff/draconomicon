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

FactoryGirl.define do
  factory :weapon do
    sequence(:name) { |n| "Weapon #{n}" }
    character

    trait :invalid do
      name ""
    end
  end
end
