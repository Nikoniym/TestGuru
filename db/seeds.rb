categories = Category.create!([{ title: 'Ruby' },
                 { title: 'Javascript' },
                 { title: 'Python' },
                 { title: 'HTML' }])

users = User.create!([{ first_name: 'Nick', last_name: 'Korataev', email: 'qwer@zx.ru', password: 'qwerez'},
             { first_name: 'Alex', last_name: 'Korataev', email: 'q@zx.ru', password: 'qwerez' }])
Admin.create!([{first_name: 'Max', last_name: 'Korataev', email: 'worldnillin@gmail.com', password: 'qwerez'}])

tests = Test.create!([{ title: 'OOP', category_id: categories[0].id, author_id: users[0].id },
                      { title: 'React', level: 4, category_id: categories[1].id, author_id: users[0].id },
                      { title: 'Angular', level: 3, category_id: categories[2].id, author_id: users[0].id },
                      { title: 'Bootstrap', level: 2, category_id: categories[3].id, author_id: users[0].id },
                      { title: 'Jquery', category_id: categories[2].id, author_id: users[0].id }])

Question.create!([{ body: 'Что такое класс?', test_id: tests[0].id },
                 { body: 'Что такое ООП?', test_id: tests[0].id },
                 { body: 'Область применния Python', test_id: tests[2].id}])

Answer.create!([{ body: 'Классы в Руби это уникальные объекты --- каждый из которых является экземпляром класса Class.', correct: true, question_id: 1 },
               { body: 'Класс представляет шаблон для создания объектов и инкапсулирует функциональность, которую должен иметь объект.', question_id: 3 }])

UserTest.create!([{ user_id: users[0].id, test_id: tests[0].id },
                    { user_id: users[0].id, test_id: tests[1].id },
                    { user_id: users[1].id, test_id: tests[0].id }])