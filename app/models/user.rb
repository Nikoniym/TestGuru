class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id
  has_many :user_tests
  has_many :tests, through: :user_tests

  validates :name, :email, presence: true

  def tests_with_level(difficulty)
    Test.tests_with_level_for_user(difficulty, id)
  end
end
