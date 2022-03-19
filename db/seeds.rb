# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

types = ["Hybrid", "Mountain", "Cruiser", "BMX", "Urban", "Road", "Fixed Gear", "Electric"]

if Type.count == 0 
  types.each do |t| 
    Type.create(name: t)
    puts "created #{t} type"
  end
end

sizes = ['<16"', '16"', '18"', '20"', '24"', '26"', '27.5"', '>27.5"']

if Size.count == 0 
  sizes.each do |s| 
    Size.create(name: s)
    puts "created #{s} size"
  end
end

genders = ["Mens", "Womens", "Unisex"]

if Gender.count == 0 
  genders.each do |g| 
    Gender.create(name: g)
    puts "created #{g} gender"
  end
end

states = ["ACT", "NSW", "NT", "QLD", "SA", "VIC", "TAS", "WA"]

if State.count == 0 
  states.each do |s| 
    State.create(name: s)
    puts "created #{s} state"
  end
end

features = ["Suspension", "Disc brakes", "Rear Rack", "Aluminium", "Fender", "Basket", "Reflector", "Stand", "Bell", "Battery"]

if Feature.count == 0 
  features.each do |f| 
    Feature.create(name: f)
    puts "created #{f} feature"
  end 
end