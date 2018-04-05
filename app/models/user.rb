require 'digest/sha1'

class User < ApplicationRecord
  attr_reader :password
  attr_writer :password_confirmation

  has_many :author_tests, class_name: 'Test', foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                    uniqueness: true

  has_secure_password

  def tests_with_level(difficulty)
    tests.where( level: difficulty )
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
