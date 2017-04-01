User.create!(name:  "administrator",
             email: "administrator@administrator.kg",
             password:              "administrator",
             password_confirmation: "administrator",
             admin: true)

9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@bla.kg"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

4.times do |n|
  name  = Faker::Commerce.department
  Category.create!(name:  name)
end


categories = Category.all
15.times do
  categories.each { |category| category.products.create!(
    content: Faker::Lorem.sentence(45),
    name: Faker::Commerce.product_name,
    contacts: Faker::PhoneNumber.cell_phone,
    user_id: rand(3)+1
    ) }
end
