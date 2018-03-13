class AddReferenceToTestsQuestionsAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :question
    add_reference :tests, :category
    add_reference :questions, :test
  end
end
