FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "tag#{n}" }
  end

  factory :user do
    email "test@email.com"
    password "test"
    password_confirmation "test"
  end

  factory :resource do
    url "http://www.example.com"
  end

  factory :api_key do
    access_token "MyString"
  end
end
