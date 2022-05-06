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
    { title: 'Ruby', author_id: users[1].id, category_id: categories[0].id },
    { title: 'CSS', author_id: users[1].id, category_id: categories[1].id },
    { title: 'HTML', author_id: users[1].id, category_id: categories[1].id }
  ]
)

questions = Question.create!(
  [
    { body: 'Кто автор Ruby?', test_id: tests[0].id },
    { body: 'Как расшифровывается CSS?', test_id: tests[1].id },
    { body: 'Какой тэг используется для обозначения ссылок?', test_id: tests[0].id }
  ]
)

Answer.create!(
  [
    { body: 'Юкихиро Мацумото', correct: true, question_id: questions[0].id },
    { body: 'Хидики Катаяма', question_id: questions[0].id },
    { body: 'Макото Нисида', question_id: questions[0].id },
    { body: 'Сэтоши Хомма', question_id: questions[0].id },
    { body: 'Cascading Style Sheets', correct: 1, question_id: questions[1].id },
    { body: 'Cascading Scalable Sheets', question_id: questions[1].id },
    { body: 'Cascading Style Scalable', question_id: questions[1].id },
    { body: 'Cascading Sheets Style', question_id: questions[1].id },
    { body: 'a', correct: 1, question_id: questions[1].id },
    { body: 'b', question_id: questions[2].id },
    { body: 's', question_id: questions[2].id },
    { body: 'p', question_id: questions[2].id }
  ]
)

Result.create!(
  [
    { test_id: tests[0].id, user_id: users[0].id },
    { test_id: tests[1].id, user_id: users[0].id }
  ]
)
