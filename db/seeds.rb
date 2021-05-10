# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    city = City.create!(name: Faker::Address.city, 
                        zip_code: Faker::Address.zip_code)
  end
  
  10.times do
    city = City.find_by(id: rand(1..City.all.length))
  
    user = User.create!(first_name: Faker::Name.first_name, 
                        last_name: Faker::Name.last_name,
                        description: Faker::Lorem.sentence,
                        email: Faker::Internet.email,
                        age: rand(18..50),
                        city: city)
  end
  
  20.times do
    user = User.find_by(id: rand(1..User.all.length))
  
    gossip = Gossip.create!(title: Faker::Lorem.sentence, 
                            content: Faker::Lorem.paragraph,
                            user: user)
  end
  
  10.times do
    tag = Tag.create!(tag: Faker::Color.color_name)
  end
  
  1.times do
    for i in 1..Gossip.all.length do
      gossip = Gossip.find_by(id: i)
      tag = Tag.find_by(id: rand(1..Tag.all.length))
  
      tag_gossip = Jointablegossiptag.create!(tag: tag, 
                                              gossip: gossip)
    end
  
  end
  
  loop do
    sender = User.find_by(id: rand(1..User.all.length))
    recipient = User.find_by(id: rand(1..User.all.length))
  
    if sender != recipient
      message = PrivateMessage.create!(content: Faker::Lorem.paragraph, sender: sender, recipient: recipient)
    end
    
    break if PrivateMessage.count == 60
  end