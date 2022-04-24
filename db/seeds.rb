# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "========== CREATING TESTING USERS =========="

Chewy.strategy(:atomic) do
  2_000.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
  
    User.create(
      first_name: first_name,
      last_name: last_name,
      email: Faker::Internet.email(name: "#{ first_name }  #{ last_name }", separators: %w(. - + _) )
    )
  end

  p "========== CREATING GLOBERS =========="
  User.create(first_name: "Diego", last_name: "Cicconi", email: "diego.cicconi@globant.com")
  User.create(first_name: "Rogger", last_name: "Valverde", email: "rogger.valverde@globant.com")
  User.create(first_name: "Ignacio", last_name: "Salinas", email: "ignacio.salinas@globant.com")
  User.create(first_name: "Omar", last_name: "Baez", email: "omar.baez@globant.com")
  User.create(first_name: "Patricio", last_name: "Arluciaga", email: "patricio.arluciaga@globant.com")
  User.create(first_name: "Carlomagno", last_name: "Lopez", email: "carlomagno.lopez@globant.com")
end
