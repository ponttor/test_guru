# frozen_string_literal: true

# create users
user1 = User.create(first_name: 'John', last_name: 'Jackson')
User.create(first_name: 'Jack', last_name: 'Johnon')

# create categories
category1 = Category.create(title: 'Frontend')
category2 = Category.create(title: 'Backend')
Category.create(title: 'Machine Learning')

# create tests
tests = Test.create([
                      { title: 'HTML', level: 1, category: category1, user: user1 },
                      { title: 'Ruby', level: 2, category: category2, user: user1 },
                      { title: 'Neural Networks', level: 3, category: category2, user: user1 },
                      { title: 'CSS', level: 1, category: category1, user: user1 },
                      { title: 'React', level: 1, category: category1, user: user1 },
                      { title: 'Redux', level: 1, category: category1, user: user1 }
                    ])

# create questions
questions = Question.create([
                              { body: 'What is HTML?', test: tests[0] },
                              { body: 'What is Ruby?', test: tests[1] },
                              { body: 'What are neural networks?', test: tests[2] }
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
