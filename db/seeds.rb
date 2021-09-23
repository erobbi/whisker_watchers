puts "Seeding Data"

eli = User.create(name: "Eli Robbins", username: "erobbi", avatar_url: "https://media-exp1.licdn.com/dms/image/C4E03AQHiBE2pKt_0ig/profile-displayphoto-shrink_800_800/0/1619623243328?e=1637798400&v=beta&t=hulh8wDIY5KUfqSl7_2MxWidivHfeWSgvywN6Xpz7rs", password: "1111", password_confirmation: "1111")

max = Cat.create(name: "Max", age: 8, food_per_day: 2, user_id: eli.id)

Weight.create(weight: 13, cat_id: max.id)

puts "Done Seeding"