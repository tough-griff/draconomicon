FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password "foobarbaz"
    password_confirmation "foobarbaz"

    trait :invalid do
      name ""
    end
  end
end
