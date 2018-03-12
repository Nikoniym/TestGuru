class AddReferenceToTestsQuestionsAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :question, index: true
    add_reference :tests, :category, index: true
    add_reference :questions, :test, index: true
  end
end
