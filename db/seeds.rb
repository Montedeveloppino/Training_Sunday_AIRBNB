# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
User.destroy_all
City.destroy_all
Listing.destroy_all
Reservation.destroy_all


20.times do
  User.create!(
    email: Faker::Internet.email,
    phone_number: Faker::Base.numerify('+336########'),
    description: Faker::Quote.yoda
  )
end

10.times do
  re = "/\(([0-8][0-9])(9[0-5])[0-9]"
  City.create!(name: Faker::Address.city,
   zip_code: Faker::Base.regexify(re),
  )
end 

50.times do
  Listing.create!(
    available_beds: rand(1..6),
    price: rand(35..700),
    description: Faker::Quote.yoda,
    has_wifi: Faker::Boolean.boolean,
    welcome_message: Faker::Quotes::Shakespeare.as_you_like_it_quote,
    is_booked: Faker::Boolean.boolean,
  )
end
  
5.times do
  Reservation.create!(start_date: Faker::Date.backward(days: 14),
  end_date: Faker::Date.backward(days: 13),
  user_id: User.all.sample.id,
  listing_id: Listing.all.sample.id,
  city_id: City.all.sample.id
  )
end

5.times do
  Reservation.create!(start_date: Faker::Date.forward(days: 14),
  end_date: Faker::Date.forward(days: 15),
  user_id: User.all.sample.id,
  listing_id: Listing.all.sample.id,
  city_id: City.all.sample.id
)
end