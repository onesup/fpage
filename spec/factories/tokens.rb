# Read about factories at https://github.com/thoughtbot/factory_girl
TOKEN = YAML.load_file("#{Rails.root}/config/test_token.yml")
FactoryGirl.define do
  factory :auth, class:Hash do
    credentials :token => "123"
    initialize_with { attributes }
  end
  
  factory :test_token, class:Hash do
    user TOKEN[:user]
    page TOKEN[:page]
    page_uid TOKEN[:page_uid]
    initialize_with { attributes }
  end

  factory :token do
    access_token "this_is_exist_token"
  end
end
