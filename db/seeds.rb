# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.all.count < 1
  30.times do
    User.create(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: '123456',
      display_name: Faker::Name.name,
      avatar: Faker::Avatar.image
    )
  end
end

if Message.all.count < 1
  sender = User.find_by_id(1)
  receiver = User.find_by_id(2)
  20.times do
    Message.create(
      subject: Faker::Job.title,
      sender_id: sender.id,
      recipent_id: receiver.id,
      body: Faker::Friends.quote
    )
  end
end
