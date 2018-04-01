class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, :email, presence: true

  def tests_with_level(difficulty)
    tests.where( level: difficulty )
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
