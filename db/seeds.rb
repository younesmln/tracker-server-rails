require 'faker'
include Faker
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Client.destroy_all
Car.destroy_all

(0..25).each do |i|
  c = Car.create(id: Number.number(11))
  p1 = Location.new(position: [ Address.latitude, Address.longitude ], time: Faker::Time.between(2.days.from_now, DateTime.now))
  p2 = Location.new(position: [ Address.latitude, Address.longitude ], time: Faker::Time.between(2.days.from_now, DateTime.now))
  c.locations.push(p1, p2)
end





