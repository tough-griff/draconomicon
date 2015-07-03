# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  character_id :integer
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

FactoryGirl.define do
  factory :item do
    sequence(:name) { |n| "Inventory item #{n}" }
    character

    trait :invalid do
      name ""
    end
  end
end
