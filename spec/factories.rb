FactoryGirl.define do
  factory :tag do
    sequence(:tag_name) { |n| "tag#{n}" }
  end

  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "test#{n}@email.com" }
    password "password"
    password_confirmation "password"
  end

  factory :resource_category do
    sequence(:category) { |n| "Category#{n}" }
  end

  factory :resource do
    sequence(:title) { |n| "resource#{n}" }
    description "Description of a resource"
    url "http://www.example.com/"
    resource_category
    license
    user
  end

  factory :api_key do
    developer
  end

  factory :license do
    sequence(:title) { |n| "MIT v#{n}" }
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
