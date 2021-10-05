puts "Seeding Data"

eli = User.create(name: "Eli", username: "erobbi", avatar_url: "https://media-exp1.licdn.com/dms/image/C4E03AQHiBE2pKt_0ig/profile-displayphoto-shrink_800_800/0/1619623243328?e=1637798400&v=beta&t=hulh8wDIY5KUfqSl7_2MxWidivHfeWSgvywN6Xpz7rs", password: "1111", password_confirmation: "1111")
Josh = User.create(name: "Josh", username: "josh", avatar_url: "https://media.istockphoto.com/photos/portrait-of-serious-mid-adult-man-picture-id805011368?k=6&m=805011368&s=612x612&w=0&h=C-h5Qo_LY3CL8VrUHFw3iTzj9wqNcylUNG7xp1YU0vo=", password: "1111", password_confirmation: "1111")


max = Cat.create(name: "Max", age: 8, cat_url: "https://i.ibb.co/j4N7G6h/IMG-2841.jpg", food_per_day: 2, bcs: 7, user_id: eli.id)
luna = Cat.create(name: "Luna", age: 6, cat_url: "https://i.ibb.co/rpDBM7Q/Cat1.jpg", food_per_day: 2, bcs: 9, user_id: eli.id)
oliver = Cat.create(name: "Oliver", age: 6, cat_url: "https://i.ibb.co/2FShhW6/Cat2.jpg", food_per_day: 2, bcs: 5, user_id: eli.id)


Weight.create(weight: 13, cat_id: max.id)
Weight.create(weight: 12, cat_id: luna.id)
Weight.create(weight: 11, cat_id: oliver.id)



puts "Done Seeding"