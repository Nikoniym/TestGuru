class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true
  validates :answers, length: { in: 1..4 }
end
