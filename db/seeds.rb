require 'faker'

Dog.destroy_all
Dogsitter.destroy_all
City.destroy_all
Stroll.destroy_all
dogs = Array.new
dogsitters = Array.new
cities = Array.new

50.times do 
    city = City.create(name: Faker::Address.city)
    cities << city
    puts "Seeding City #{city.name}"
end

150.times do 
    dog = Dog.create(
    name: Faker::FunnyName.name,
    city_id: cities[rand(0..49)].id)
    dogs << dog
    puts "Seeding Dog #{dog.name}"
end

150.times do 
    dogsitter = Dogsitter.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: cities[rand(0..49)].id)
    dogsitters << dogsitter
    puts "Seeding Dogsitter #{dogsitter.first_name} #{dogsitter.last_name}"
end

70.times do
    stroll = Stroll.create(
        dog_id: dogs[rand(0..149)].id,
        dogsitter_id: dogsitters[rand(0..149)].id,
        city_id: cities[rand(0..49)].id,
        date: Time.at(rand * Time.now.to_i))
    puts "Seeding Stroll #{stroll.id}"
end