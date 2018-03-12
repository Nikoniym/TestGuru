class User < ApplicationRecord
  def show_tests_level(difficulty)
    Test.joins('JOIN user_tests ON tests.id = user_tests.test_id')
        .where(level: difficulty, user_tests: { user_id: self.id })
  end
end
