# == Schema Information
#
# Table name: armors
#
#  id                   :integer          not null, primary key
#  character_id         :integer
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

FactoryGirl.define do
  factory :armor do
    sequence(:name) { |n| "Armor #{n}" }
    character

    trait :invalid do
      name ""
    end
  end
end
