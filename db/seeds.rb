# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

valentin = User.create(
  first_name: "Valentin",
  last_name: "Birault",
  email: "biraultvalentin@gmail.com",
  password: "123456",
  user_type: "admin_organization"
)

pierre = User.create!(
  first_name: "Pierre",
  last_name: "Hervé-Bazin",
  email: "pierrehervebazin@gmail.com",
  password: "123456",
  user_type: "volunteer"
)

puts '-----------------------------------------'
puts valentin.full_name
puts pierre.full_name
puts '-----------------------------------------'
puts 'Users created !'


orgas = Organization.create(
  [
    {
      name: "Volunteering World",
      description: "Volunteering world is basically just an organization to run seeds and test models",
      location: "Barcelona",
      address: "58 carrer de Viladomat, 1-4",
      user_id: valentin.id
    },
    {
      name: "Volunteering World Second",
      description: "Volunteering world is basically just an organization to run seeds and test models",
      location: "Barcelona",
      address: "60 carrer de Viladomat, 1-4",
      user_id: valentin.id
    }
  ]
)

puts '-----------------------------------------'
puts Organization.first

puts '-----------------------------------------'
puts Organization.last

puts 'Organizations created !'

Mission.create(
  [
    {
      name: "Distribution of food",
      description: "Give an hand to our association during few hours to help us hand out foods and materials",
      capacity: 5,
      location: "Paris",
      address: "14 ème, albert street",
      start_date: DateTime.now + 5.days,
      end_date: DateTime.now + 3.hours + 5.days,
      organization_id: Organization.first.id,
      user_id: pierre.id
    },
    {
      name: "Distribution of goods",
      description: "Give an hand to our association during few hours to help us hand out foods and materials",
      capacity: 5,
      location: "Paris",
      address: "17 ème, romane street",
      start_date: DateTime.now + 5.days,
      end_date: DateTime.now + 3.hours + 5.days,
      organization_id: Organization.last.id,
      user_id: nil
    }
  ]
)

puts '---------------------------------'
puts Mission.first.name
puts Mission.last.name

puts '---------------------------------'
puts 'Missions created'