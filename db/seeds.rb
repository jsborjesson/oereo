# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Developer.create!(email: 'dev@email.com', password: 'password', password_confirmation: 'password')

# TODO: Create more users
u = User.create!(username: 'test', email: 'test@email.com', password: 'password', password_confirmation: 'password')
u2 = User.create!(username: 'test2', email: 'test2@email.com', password: 'password', password_confirmation: 'password')

c = ResourceCategory.create!(category: 'Site')
ResourceCategory.create!(category: 'YouTube')
ResourceCategory.create!(category: 'Image')
ResourceCategory.create!(category: 'Other')

l = License.create!(title: 'MIT License', agreement_url: 'http://opensource.org/licenses/MIT')
l2 = License.create!(title: 'Public Domain (no license)', agreement_url: 'http://en.wikipedia.org/wiki/Public_domain')
License.create!(title: 'GPL v2', agreement_url: 'http://www.gnu.org/licenses/gpl-2.0.html')
License.create!(title: 'Apache License v2', agreement_url: 'http://www.apache.org/licenses/LICENSE-2.0.html')
License.create!(title: 'Creative Commons (CC BY 4.0)', agreement_url: 'http://creativecommons.org/licenses/by/4.0/deed.en_US')

r = Resource.create!(user: u, resource_category: c, license: l2, title: 'Ruby Tapas', url: 'http://www.rubytapas.com/')
Resource.create!(user: u, resource_category: c, license: l2, title: 'RailsCasts', url: 'http://railscasts.com/')
Resource.create!(user: u, resource_category: c, license: l2, title: 'SemVer', url: 'http://semver.org/', description: 'Semantic software versioning')
Resource.create!(user: u, resource_category: c, license: l2, title: 'Stack Overflow', url: 'http://www.stackoverflow.com')

t1 = Tag.create!(tag_name: 'ruby')
t2 = Tag.create!(tag_name: 'python')
Tag.create!(tag_name: 'php')

# Add a couple of tags to a resource
r.tags << t1
r.tags << t2
r.save!

