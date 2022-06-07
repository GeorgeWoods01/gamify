# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "date"
require "time"

MissionSetup.destroy_all
Mission.destroy_all
Student.destroy_all
Classroom.destroy_all
User.destroy_all

puts "creating Fred the user"

User.create!(email: "Fred@gmail.com", password: "123456", first_name: "Fred", last_name: "Smith")

puts "creating Fred's classroom"

Classroom.create!(user: User.last)

puts "creating Fred's students"

Student.create!(first_name: "James", last_name: "Smith", date_of_birth: Date.parse("09/05/2015"), coins: 25, classroom: Classroom.last)
Student.create!(first_name: "Anna", last_name: "Smith", date_of_birth: Date.parse("10/06/2015"), coins: 15, classroom: Classroom.last)
Student.create!(first_name: "Beatriz", last_name: "Smith", date_of_birth: Date.parse("11/07/2015"), coins: 100, classroom: Classroom.last)
Student.create!(first_name: "Eugenia", last_name: "Smith", date_of_birth: Date.parse("12/08/2015"), coins: 70, classroom: Classroom.last)
Student.create!(first_name: "Pablo", last_name: "Smith", date_of_birth: Date.parse("13/09/2015"), coins: 45, classroom: Classroom.last)
Student.create!(first_name: "David", last_name: "Smith", date_of_birth: Date.parse("14/10/2015"), coins: 30, classroom: Classroom.last)
Student.create!(first_name: "Paulo", last_name: "Smith", date_of_birth: Date.parse("15/11/2015"), coins: 10, classroom: Classroom.last)
Student.create!(first_name: "Verónica", last_name: "Smith", date_of_birth: Date.parse("15/12/2015"), coins: 60, classroom: Classroom.last)
Student.create!(first_name: "Guillermo", last_name: "Smith", date_of_birth: Date.parse("17/01/2015"), coins: 70, classroom: Classroom.last)
Student.create!(first_name: "Bob", last_name: "Smith", date_of_birth: Date.parse("18/12/2015"), coins: 80, classroom: Classroom.last)

puts "creating missions"

mission_one = Mission.create!(name: "work with your partner", coins: 30, description: "Really try and work well with your partner today, listen to each other, help each other, respect each other!", time_length: (Time.now + 3600), classroom: Classroom.last)
mission_two = Mission.create!(name: "Finish the maths exercises", coins: 10, description: "finish up to question number 10", time_length: (Time.now + 3600), classroom: Classroom.last)
mission_three = Mission.create!(name: "always put your hand up", coins: 50, description: "Don't shout out, if you have a question, put your hand up!!!", time_length: (Time.now + 21600), classroom: Classroom.last)

puts "creating misson setups"

Student.all.each do |student|
  MissionSetup.create!(student: student, mission: mission_one, completion: false)
  MissionSetup.create!(student: student, mission: mission_two, completion: false)
  MissionSetup.create!(student: student, mission: mission_three, completion: false)
end
