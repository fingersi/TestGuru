
admin = User.find_or_create_by(login: 'admin', email: 'admin@trymail.ru') do |user|
  type = 'admin'
  password = 'IAmAdmin!'
  password_confirmation = 'IAmAdmin!'
end

user = User.find_or_create_by(login: 'user', email: 'user@trymail.ru') do |user|
  type = 'user' 
  password = 'IAmUser!' 
  password_confirmation= 'IAmUser!'
end

category1 = Category.find_or_create_by(title: 'Mathematics')

category2 = Category.find_or_create_by(title: 'History')

test1 = Test.find_or_create_by(title: 'Basic Math', level: 1, category_id: category1.id, author_id: admin.id)

test2 = Test.find_or_create_by(title: 'Russian history', level: 2, category_id: category2.id, author_id: admin.id)

test3 = Test.find_or_create_by(title: 'Roman history', level: 3, category_id: category2.id, author_id: admin.id)

question1 = Question.find_or_create_by(body: 'Выберете год основания Российского государства', test_id: test2.id)
Answer.find_or_create_by(value: '882', correct: true, question_id: question1.id)
Answer.find_or_create_by(value: '890', correct: false, question_id: question1.id)
Answer.find_or_create_by(value: '893', correct: false, question_id: question1.id)

question2 = Question.find_or_create_by(body: 'Какой князь захватил Киев и объединил славянские земли севера и юга', test_id: test2.id)
Answer.find_or_create_by(value: 'Пётр', correct: false, question_id: question2.id)
Answer.find_or_create_by(value: 'Ярополк', correct: false, question_id: question2.id)
Answer.find_or_create_by(value: 'Олег', correct: true, question_id: question2.id)

question3 = Question.find_or_create_by(body: 'Сколько будет 3 + 5 = ?', test_id: test1.id)
Answer.find_or_create_by(value: '6', correct: false, question_id: question3.id)
Answer.find_or_create_by(value: '8', correct: true, question_id: question3.id)
Answer.find_or_create_by(value: '11', correct: false, question_id: question3.id)

question4 = Question.find_or_create_by(body: 'Сколько будет 4 * 3 = ?', test_id: test3.id)
Answer.find_or_create_by(value: '90', correct: false, question_id: question4.id)
Answer.find_or_create_by(value: '11', correct: false, question_id: question4.id)
Answer.find_or_create_by(value: '12', correct: true, question_id: question4.id)

question5 = Question.find_or_create_by(body: 'Год основания Рима', test_id: test2.id)
Answer.find_or_create_by(value: '753 до н.э.', correct: true, question_id: question5.id)
Answer.find_or_create_by(value: '1 н.э', correct: false, question_id: question5.id)
Answer.find_or_create_by(value: '543 до н.э', correct: false, question_id: question5.id)

