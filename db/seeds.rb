# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users_count = 10
items_count = 10
orders_count = 8

users_count.times do
	User.Create({
		#Faker::Internet.password(10, 20) #=> "EoC9ShWd1hWq4vBgFw",
		name: Faker::Name.first_name,
		surname: Faker::Name.last_name,
		username: Faker::Internet.username(5..8),
		phone: Faker::PhoneNumber.phone_number_with_country_code,
		email: Faker::Internet.emai,
		role_id: 1
	})


Category.Create({
	title: "Test Category"
	description: "BlahBluah Category"
})

Subcategory.Create({
	title: "Test Subcategory"
	description: "description of a SUBbcategory"
	#category: reference here?
})
items_count.times do
	Item.Create({
		title: Faker::Device.model_name,
		description: Faker::Lorem.sentenc,
		price: Faker::Number.decimal(2, 3) #=> "18.843",
		duration: 1 + rand(7)
	})
end


