# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    { name: 'Student', password: '123', group: 'student' },
    { name: 'Teacher', password: '123!', group: 'teacher' }
  ]
)

categories = Category.create!(
  [
    { title: 'Backend' },
    { title: 'Frontend' }
  ]
)

tests = Test.create!(
  [
    { title: 'Ruby', author: users[1], category: categories[0] },
    { title: 'CSS', author: users[1], category: categories[1] },
    { title: 'HTML', author: nil, category: categories[1] }
  ]
)

questions = Question.create!(
  [
    { body: 'Кто автор Ruby?', test: tests[0] },
    { body: 'Как расшифровывается CSS?', test: tests[1] },
    { body: 'Какой тэг используется для обозначения ссылок?', test: tests[2] }
  ]
)

Answer.create!(
  [
    { body: 'Юкихиро Мацумото', correct: true, question: questions[0] },
    { body: 'Хидики Катаяма', question: questions[0] },
    { body: 'Макото Нисида', question: questions[0] },
    { body: 'Сэтоши Хомма', question: questions[0] },
    { body: 'Cascading Style Sheets', correct: 1, question: questions[1] },
    { body: 'Cascading Scalable Sheets', question: questions[1] },
    { body: 'Cascading Style Scalable', question: questions[1] },
    { body: 'Cascading Sheets Style', question: questions[1] },
    { body: 'a', correct: 1, question: questions[1] },
    { body: 'b', question: questions[2] },
    { body: 's', question: questions[2] },
    { body: 'p', question: questions[2] }
  ]
)

Result.create!(
  [
    { test: tests[0], user: users[0] },
    { test: tests[1], user: users[0] }
  ]
)
