require 'faker'

5.times do 
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8)
    )

  user.skip_confirmation!
  user.save!
end

users = User.all

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'allisonrgoldfarb@gmail.com',
  password: 'helloworld'
)

10.times do
  Topic.create!(
    user: users.sample,
    title: Faker::Lorem.sentence
    )
end

topics = Topic.all

100.times do
  Bookmark.create!(
    topic: topics.sample,
    url: Faker::Internet.url
    )
end

bookmarks = Bookmark.all

puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"