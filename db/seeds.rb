# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)
User.create username: "Sokheng1",
            email: "yongsokheng@gmail1.com",
            password: "123456",
            password_confirmation: "123456"
User.create username: "Sokheng2",
            email: "yongsokheng@gmail2.com",
            password: "123456",
            password_confirmation: "123456"
User.create username: "Sokheng3",
            email: "yongsokheng@gmail3.com",
            password: "123456",
            password_confirmation: "123456"
User.create username: "Sokheng4",
            email: "yongsokheng@gmail4.com",
            password: "123456",
            password_confirmation: "123456"

10.times do
  name = Faker::Commerce.department
  description = Faker::Lorem.sentence 5
  Category.create name: name, description: description
end

categories = Category.all
30.times do
  categories.each do |category|
    keyword = Faker::Lorem.word
    category.words.create keyword: keyword
  end
end

words = Word.all
3.times do
  words.each do |word|
    meaning = Faker::Lorem.word
    word.answers.create meaning: meaning
  end
end

words.each do |word|
  meaning = Faker::Lorem.word
  word.answers.create meaning: meaning, correct_answer: true
end
