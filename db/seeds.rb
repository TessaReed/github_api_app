# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#generate ten titles from faker
PROJECT_TITLES = 10.times.map { Faker::Internet.domain_word }

#split those titles between two people
SPLIT = 0.4
OFFSET = PROJECT_TITLES.length * SPLIT

PROJECT_USERS = {
  'tessa@example.com' => PROJECT_TITLES[0, OFFSET],
  'bob@example.com' => PROJECT_TITLES[OFFSET..-1]
}

#build and add projects to that user and a single save per user
PROJECT_USERS.each do |email, projects|
  user = User.new(email: email, password: 'secret')
  projects.each { |title| user.projects.build(title: title)}
  user.save
end
