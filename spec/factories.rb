FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "tag#{n}" }
  end

  factory :user do
    email "MyString"
    password_hash "MyString"
    password_salt "MyString"
  end

  factory :resource do
  end

  factory :api_key do
    access_token "MyString"
  end
end
