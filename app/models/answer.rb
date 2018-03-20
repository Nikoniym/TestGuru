class Answer < ApplicationRecord
  belongs_to :question

  scope :true_answer, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  def validate_max_answers
    errors.add(:base, I18n.t('.limit_max_answers')) if question.answers.count >= 4
  end
end
