# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    trait :user1 do
      email "user1@gmail.com"
      password "11111111"
    end
  end
end
