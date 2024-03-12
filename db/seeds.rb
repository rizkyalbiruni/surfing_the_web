# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
 require 'faker'

puts "Cleaning up database..."
Surfboard.destroy_all
puts "Database cleaned"

20.times do |i|
  User.create!(email: Faker::Internet.email, encrypted_password: Faker::Internet.password,password: Faker::Internet.password )
end

 20.times do |i|
  Surfboard.create!(board_type: Faker::Creature::Animal.name,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ornare at elit non accumsan. Fusce sapien nisl, viverra in justo egestas, volutpat convallis lectus. Aliquam ut ipsum nec dolor molestie sagittis. Suspendisse volutpat laoreet ipsum eget pulvinar. Mauris sit amet lectus eget nisl cursus elementum sit amet ac massa. Mauris",
  img_url: "https://source.unsplash.com/random?surfing", location: Faker::Address.city, user: User.all.sample)
end
