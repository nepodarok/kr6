User.create!(email: 'asd@asd.asd', password: 'asdasd', password_confirmation: 'asdasd', username: 'asdasd')
# Photo.create!(name: Faker::Lorem.sentence(5), user_id: 1, pic: 'IMG_31032017_133427_0.png')

2.times do |n|
  username  = Faker::Name.name
  email = Faker::Internet.email
  password = 'asdasd'
  password_confirmation = 'asdasd'

  User.create!(
  username:  username,
  email: email,
  password: password,
  password_confirmation: password_confirmation
  )
end

#
#
# users = User.all
# 2.times do
#   users.each { |user| user.photos.create!(
#     name: Faker::Lorem.sentence(15),
#     user_id: user.id,
#     pic: 'IMG_31032017_133427_0.png'
#     ) }
# end
