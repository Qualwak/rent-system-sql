# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users_count = 30

category = Category.create({
	title: "Test Category",
	description: "BlahBluah Category"
})
subcategory = Subcategory.create({
	title: "Test Subcategory",
	description: "description of a SUBbcategory",
	category: category
})

users_count.times do
	user = User.create({
		#Faker::Internet.password(10, 20) #=> "EoC9ShWd1hWq4vBgFw",
		name: Faker::Name.first_name,
		surname: Faker::Name.last_name,
		username: Faker::Internet.username(5..8),
		phone: Faker::PhoneNumber.phone_number_with_country_code,
		email: Faker::Internet.email,
		role_id: 1
	})
	Item.create({
		title: Faker::Device.model_name,
		description: Faker::Lorem.sentence,
		price: Faker::Number.decimal(2, 3), #=> "18.843",
		duration: 1 + rand(7),	
		subcategory: subcategory,
		user: user
	})
end

