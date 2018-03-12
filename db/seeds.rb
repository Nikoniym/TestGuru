Category.create([{ title: 'Ruby' },
                 { title: 'Javascript' },
                 { title: 'Python' },
                 { title: 'HTML' }])

Test.create([{ title: 'OOP', category_id: 1 },
             { title: 'React', level: 4, category_id: 2 },
             { title: 'Angular', level: 3, category_id: 3 },
             { title: 'Bootstrap', level: 2, category_id: 4 },
             { title: 'Jquery', category_id: 2 }])

User.create([{ name: 'Nick' },
             { name: 'Alex' }])

Question.create([{ body: 'Что такое класс?', test_id: 1 },
                 { body: 'Что такое ООП?', test_id: 1 },
                 { body: 'Область применния Python', test_id: 3 }])

Answer.create([{ body: 'Классы в Руби это уникальные объекты --- каждый из которых является экземпляром класса Class.', correct: true, question_id: 1 },
               { body: 'Класс представляет шаблон для создания объектов и инкапсулирует функциональность, которую должен иметь объект.', question_id: 3 }])

UserTest.create([{ user_id: 1, test_id: 1 },
                    { user_id: 1, test_id: 2 },
                    { user_id: 2, test_id: 1 }])