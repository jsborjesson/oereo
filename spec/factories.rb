FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "tag#{n}" }
  end

  factory :user do
    email "test@email.com"
    password "password"
    password_confirmation "password"
  end

  factory :resource do
    sequence(:title) { |n| "resource#{n}" }
    description "Description of a resource"
    url "http://www.example.com/"
  end

  factory :api_key do
    access_token "MyString"
  end
end
