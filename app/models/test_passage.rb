class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_update :before_save_set_next_question
  before_validation :before_validation_set_first_question, on: :create


  def completed?
    current_question.nil?
  end

  def position_current_question
    if current_question.nil?
      question_count
    else
      test.questions.index(current_question) + 1
    end
  end

  def question_count
    test.questions.count
  end

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)
    save!
  end

  def passed?
    percent >= 85
  end

  def percent
    (correct_question.to_f / correct_count.to_f * 100).round
  end

  def timer?
    test.timer.present?
  end

  def timer
    test.timer - (Time.current - created_at)
  end

  def time_over?
    if timer?
      timer <= 0
    else
      false
    end
  end

  private

  def correct_count
    Answer.joins(:question)
          .where(questions: { test: self.test}, correct: true)
          .count
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    if answer_ids.nil?
      false
    else
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_save_set_next_question
    self.current_question = next_question
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
