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

FactoryGirl.define do
  factory :character_class do
    sequence(:name) { |n| "Class #{n}" }
    sequence(:abbreviation) do |n|
      a = (96 + n / 26 / 26 % 26 + 1).chr
      b = (96 + n / 26 % 26 + 1).chr
      c = (96 + n % 26 + 1).chr
      "#{a}#{b}#{c}"
    end

    after(:build) { |char_class| char_class.slug = char_class.abbreviation }

    trait :invalid do
      abbreviation "Hello"
    end
  end
end
