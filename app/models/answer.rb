class Answer < ApplicationRecord
  belongs_to :question

  scope :true_answer, -> { where(correct: true) }

  validates :body, presence: true
end
