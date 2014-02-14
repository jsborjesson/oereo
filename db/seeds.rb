# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO: Create a developer and more users

u = User.create!(username: 'test', email: 'test@email.com', password: 'password', password_confirmation: 'password')

c = ResourceCategory.create!(category: 'Site')
ResourceCategory.create!(category: 'YouTube')
ResourceCategory.create!(category: 'Image')
ResourceCategory.create!(category: 'Other')

Resource.create!(user: u, resource_category: c, title: 'Google', url: 'http://www.google.com')
Resource.create!(user: u, resource_category: c, title: 'Let Me Google That For You', url: 'http://www.lmgtfy.com')
Resource.create!(user: u, resource_category: c, title: 'Stack Overflow', url: 'http://www.stackoverflow.com')
Resource.create!(user: u, resource_category: c, title: 'Wikipedia', url: 'http://www.wikipedia.org')

License.create!(title: 'MIT License', agreement_url: 'http://opensource.org/licenses/MIT')
License.create!(title: 'GPL v2', agreement_url: 'http://www.gnu.org/licenses/gpl-2.0.html')
License.create!(title: 'Apache License v2', agreement_url: 'http://www.apache.org/licenses/LICENSE-2.0.html')
License.create!(title: 'Public Domain (no license)', agreement_url: 'http://en.wikipedia.org/wiki/Public_domain')
License.create!(title: 'Creative Commons (CC BY 4.0)', agreement_url: 'http://creativecommons.org/licenses/by/4.0/deed.en_US')

Tag.create!(tag_name: 'ruby')
Tag.create!(tag_name: 'python')
Tag.create!(tag_name: 'php')

