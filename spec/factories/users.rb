# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    trait :user_without_token do
      email "no_token@gmail.com"
      password "11111111"
    end
    trait :user_with_token do
      email "with_token@gmail.com"
      password "11111111"
      token
    end
  end
end
