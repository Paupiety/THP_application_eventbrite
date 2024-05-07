# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Event.destroy_all
min = 1
max = 200

random_duration = rand(min..max) * 5
puts random_duration
nb_caracters = rand(1..1000)
User.create(email: "michel@yopmail.com", encrypted_password: "micheldu31", description: Faker::Lorem.sentences.join, first_name: "Michel", last_name:  Faker::Name.last_name)
User.create(email: "jeannette@yopmail.com", encrypted_password: "jeannettedu31", description: Faker::Lorem.sentences.join, first_name: "Jeannette", last_name:  Faker::Name.last_name)
User.create(email: "christine@yopmail.com", encrypted_password: "christinedu31", description: Faker::Lorem.sentences.join, first_name: "Christine", last_name:  Faker::Name.last_name)
User.create(email: "lola@yopmail.com", encrypted_password: "loladu31", description: Faker::Lorem.sentences.join, first_name: "Lola", last_name:  Faker::Name.last_name)

10.times do
    Event.create(start_date: Faker::Date.forward(days: 1000), duration: random_duration, title: Faker::Book.title, description: Faker::Lorem.sentences.join, price: Faker::Number.between(from: 1, to: 1000), location: Faker::Address.city, user: User.all.sample)
end
#DateTime.new(2025,5,6,10,0,0)

Attendance.create(stripe_customer_id: "014584785789", user: User.find_by(first_name: "Christine"), event: Event.last)