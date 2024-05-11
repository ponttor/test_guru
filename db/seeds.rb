# frozen_string_literal: true

# create users
user1 = User.create(first_name: 'John', last_name: 'Jackson')
user2 = User.create(first_name: 'Jack', last_name: 'Johnson')

# create categories
category1 = Category.create(title: 'Frontend')
category2 = Category.create(title: 'Backend')
Category.create(title: 'Machine Learning')

# create tests
tests = Test.create([
                      { title: 'HTML', level: 1, category: category1, author: user1 },
                      { title: 'Ruby', level: 2, category: category2, author: user2 },
                      { title: 'Neural Networks', level: 3, category: category2, author: user1 },
                      { title: 'CSS', level: 1, category: category1, author: user2 },
                      { title: 'React', level: 1, category: category1, author: user1 },
                      { title: 'Redux', level: 1, category: category1, author: user2 }
                    ])

# create test results
TestResult.create([
                    { test: tests.first, user_id: user1.id, score: 40 },
                    { test: tests.second, user_id: user1.id, score: 50 },
                    { test: tests.third, user_id: user1.id, score: 60 },
                    { test: tests.fourth, user_id: user1.id, score: 70 },
                    { test: tests.fifth, user_id: user1.id, score: 80 },
                    { test: tests.fifth, user_id: user2.id, score: 80 },
                    { test: tests.last, user_id: user2.id, score: 80 }
                  ])

# create questions
questions = Question.create([
                              { body: 'What is HTML?', test_id: tests[0].id },
                              { body: 'What is Ruby?', test_id: tests[1].id },
                              { body: 'What are neural networks?', test_id: tests[2].id }
                            ])

# create correct answers
Answer.create([
                { correct: true, question: questions.first, body: 'HyperText Markup Language' },
                { correct: true, question: questions.second, body: 'A programming language' },
                { correct: true, question: questions.last,
                  body: 'A set of algorithms that attempt to recognize underlying relationships in a set of data through a process that mimics the way the human brain operates' }
              ])

# create wrong answers
Answer.create([
                { correct: false, question: questions.first, body: 'A set of algorithms' },
                { correct: false, question: questions.second, body: 'A hero' },
                { correct: false, question: questions.last, body: 'just my imagination' }
              ])
