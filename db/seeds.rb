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
  encrypted_password: "123456"
  type: "admin_organization"
)

pierre = User.create(
  first_name: "Pierre",
  last_name: "Hervé-Baz",
  email: "pierrehervebazin@gmail.com",
  encrypted_password: "123456"
  type: "volunteer"
)

Organization.create(
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
