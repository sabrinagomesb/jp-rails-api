# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create States and Cities from JSON file

filepath = ENV.fetch('FILEPATH', Rails.root.join('db', 'states_cities.json').to_s)
states = JSON.parse(File.read(filepath))

states.each do |state|
  state_obj = State.find_or_create_by(acronym: state['acronym'], name: state['name'])

  state['cities'].each do |city|
    City.find_or_create_by(name: city['name'], state: state_obj)
    puts "Adicionando a cidade #{city['name']} ao estado #{state_obj.name}"
  end
end

puts 'Inserting kind of contact...'

kinds = %w[friend family work]
kinds.each do |kind|
  Kind.find_or_create_by(description: kind)
end

puts 'Kind of contact inserted!'

puts 'Inserting contact...'
100.times do
  Contact.find_or_create_by(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
    kind: Kind.all.sample
  )
end
puts 'Contact inserted!'

puts 'Inserting address...'
Contact.all.each do |contact|
  Address.find_or_create_by(
    street: Faker::Address.street_name,
    city_id: City.all.sample.id,
    contact:
  )
end
puts 'Address inserted!'

puts 'Inserting phone...'

Contact.all.each do |contact|
  rand(1..5).times do
    Phone.find_or_create_by(
      number: Faker::PhoneNumber.cell_phone,
      contact:
    )
  end
end
puts 'Phone inserted!'
