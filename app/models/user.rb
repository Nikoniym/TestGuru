class User < ApplicationRecord
  has_many :tests
  has_many :user_tests
  has_many :tests, through: :user_tests

  def tests_with_level(difficulty)
    Test.joins('JOIN user_tests ON tests.id = user_tests.test_id')
        .where(level: difficulty, user_tests: { user_id: self.id })
  end
end
