FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "tag#{n}" }
  end

  factory :user do
    sequence(:email) { |n| "test#{n}@email.com" }
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

  factory :license do
    title "MyString"
    agreement "MyText"
  end

  factory :developer do
  end

  factory :admin_user do
  end
end
