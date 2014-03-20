namespace :oereo do
  task :dummy_data => :environment do
    require 'faker'

    5.times do
      User.create(
        username: Faker::Internet.user_name,
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password',
      )
    end

    20.times do
      Resource.create!(
        user: User.order("RANDOM()").first,
        resource_category: ResourceCategory.order("RANDOM()").first,
        license: License.order("RANDOM()").first,
        title: Faker::Company.name,
        description: Faker::Company.bs,
        url: Faker::Internet.url,
      )
    end
  end
end
