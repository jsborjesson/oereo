# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'test@email.com', password: 'test', password_confirmation: 'test')

Resource.create!(title: 'Google', url: 'www.google.com')
Resource.create!(title: 'Let Me Google That For You', url: 'www.lmgtfy.com')
Resource.create!(title: 'Stack Overflow', url: 'www.stackoverflow.com')
Resource.create!(title: 'Wikipedia', url: 'www.wikipedia.org')

License.create!(title: 'MIT License', agreement_url: 'http://opensource.org/licenses/MIT')
License.create!(title: 'GPL v2', agreement_url: 'http://www.gnu.org/licenses/gpl-2.0.html')
License.create!(title: 'Apache License v2', agreement_url: 'http://www.apache.org/licenses/LICENSE-2.0.html')
License.create!(title: 'Public Domain (no license)', agreement_url: 'http://en.wikipedia.org/wiki/Public_domain')
