FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "tag#{n}" }
  end

  factory :user do
    email "user@email.com"
    password_hash "MyString"
    password_salt "MyString"
  end

  factory :resource do
    url "http://www.example.com"
  end

  factory :api_key do
    access_token "MyString"
  end
end
