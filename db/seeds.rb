# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "date"
require "time"
require "open-uri"

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

student_one = Student.new(first_name: "James", last_name: "Smith", date_of_birth: Date.parse("09/05/2015"), coins: 25, classroom: Classroom.last)
file_one = URI.open('https://icons.iconarchive.com/icons/hopstarter/halloween-avatar/256/Bat-icon.png')
student_one.photo.attach(io: file_one, filename: 'nes.png', content_type: 'image/png')
student_one.save
student_two = Student.create!(first_name: "Anna", last_name: "Smith", date_of_birth: Date.parse("10/06/2015"), coins: 15, classroom: Classroom.last)
file_two = URI.open('https://icons.iconarchive.com/icons/hopstarter/halloween-avatar/128/Capt-Spaulding-icon.png')
student_two.photo.attach(io: file_two, filename: 'nes.png', content_type: 'image/png')
student_two.save
student_three = Student.create!(first_name: "Beatriz", last_name: "Smith", date_of_birth: Date.parse("11/07/2015"), coins: 100, classroom: Classroom.last)
file_three = URI.open('https://icons.iconarchive.com/icons/hopstarter/halloween-avatar/128/Diablo-icon.png')
student_three.photo.attach(io: file_three, filename: 'nes.png', content_type: 'image/png')
student_three.save
student_four = Student.create!(first_name: "Eugenia", last_name: "Smith", date_of_birth: Date.parse("12/08/2015"), coins: 70, classroom: Classroom.last)
file_four = URI.open('https://icons.iconarchive.com/icons/hopstarter/halloween-avatar/256/Extraterrestrial-icon.png')
student_four.photo.attach(io: file_four, filename: 'nes.png', content_type: 'image/png')
student_four.save
student_five = Student.create!(first_name: "Pablo", last_name: "Smith", date_of_birth: Date.parse("13/09/2015"), coins: 45, classroom: Classroom.last)
file_five = URI.open('https://icons.iconarchive.com/icons/hopstarter/halloween-avatar/128/Frankenstein-icon.png')
student_five.photo.attach(io: file_five, filename: 'nes.png', content_type: 'image/png')
student_five.save
student_six = Student.create!(first_name: "David", last_name: "Smith", date_of_birth: Date.parse("14/10/2015"), coins: 30, classroom: Classroom.last)
file_six = URI.open('https://icons.iconarchive.com/icons/hopstarter/halloween-avatar/128/Goomba-icon.png')
student_six.photo.attach(io: file_six, filename: 'nes.png', content_type: 'image/png')
student_six.save
student_seven = Student.create!(first_name: "Paulo", last_name: "Smith", date_of_birth: Date.parse("15/11/2015"), coins: 10, classroom: Classroom.last)
file_seven = URI.open('https://icons.iconarchive.com/icons/hopstarter/halloween-avatar/256/Hellboy-icon.png')
student_seven.photo.attach(io: file_seven, filename: 'nes.png', content_type: 'image/png')
student_seven.save
student_eight = Student.create!(first_name: "Verónica", last_name: "Smith", date_of_birth: Date.parse("15/12/2015"), coins: 60, classroom: Classroom.last)
file_eight = URI.open('https://icons.iconarchive.com/icons/hopstarter/halloween-avatar/256/Jake-Sulley-icon.png')
student_eight.photo.attach(io: file_eight, filename: 'nes.png', content_type: 'image/png')
student_eight.save
student_nine = Student.create!(first_name: "Guillermo", last_name: "Smith", date_of_birth: Date.parse("17/01/2015"), coins: 70, classroom: Classroom.last)
file_nine = URI.open('https://icons.iconarchive.com/icons/hopstarter/halloween-avatar/256/Minion-Pig-icon.png')
student_nine.photo.attach(io: file_nine, filename: 'nes.png', content_type: 'image/png')
student_nine.save
student_ten = Student.create!(first_name: "Bob", last_name: "Smith", date_of_birth: Date.parse("18/12/2015"), coins: 80, classroom: Classroom.last)
file_ten = URI.open('https://icons.iconarchive.com/icons/hopstarter/halloween-avatar/128/Zombie-icon.png')
student_ten.photo.attach(io: file_ten, filename: 'nes.png', content_type: 'image/png')
student_ten.save

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
