# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auth, class:Hash do
    credentials :token => "123"
    initialize_with { attributes }
  end

  factory :token do
    access_token "this_is_exist_token"
  end
end
