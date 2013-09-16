FactoryGirl.define do
  factory :user do
    trait :user1 do
      email "user1@gmail.com"
      password "88888888"
    end
  end
end