FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "tag#{n}" }
  end

  factory :user do
    sequence(:username) { |n| "user#{n}" }
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
  end

  factory :license do
    title "MIT"
    agreement_url "http://opensource.org/licenses/MIT"
  end

  factory :developer do
    sequence(:email) { |n| "developer#{n}@email.com" }
    password "password"
    password_confirmation "password"
  end

  factory :admin_user do
  end
end
