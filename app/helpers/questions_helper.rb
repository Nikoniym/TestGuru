module QuestionsHelper
  def question_header
    if action_name == 'new'
      "Создайте новый вопрос для теста #{@test.title}"
    else
      "Редактирование вопроса для теста #{@question.test.title}"
    end
  end
end
