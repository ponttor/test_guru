# frozen_string_literal: true

# create users
User.create([
              { first_name: 'John', last_name: 'Jackson' },
              { first_name: 'Jack', last_name: 'Johnon' }
            ])

# create categories
categories = Category.create([
                               { title: 'Frontend' },
                               { title: 'Backend' },
                               { title: 'Machine Learning' }
                             ])

# create tests
tests = Test.create([
                      { title: 'HTML', level: 1, category: categories[0], user: User.first },
                      { title: 'Ruby', level: 2, category: categories[1], user: User.first },
                      { title: 'Neural Networks', level: 3, category: categories[2], user: User.first },
                      { title: 'CSS', level: 1, category: categories[0], user: User.first },
                      { title: 'React', level: 1, category: categories[0], user: User.first },
                      { title: 'Redux', level: 1, category: categories[0], user: User.first }
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
