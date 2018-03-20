class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true
end
