# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

i=0
while i < 20
  i += 1
  Rating.create!(title: "Rating ##{i}", rating: rand(5), user_id: 5, book_id: 1)
end

