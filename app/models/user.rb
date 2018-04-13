class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  attr_reader :password
  attr_writer :password_confirmation

  has_many :author_tests, class_name: 'Test', foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/,
                    uniqueness: true

  def tests_with_level(difficulty)
    tests.where( level: difficulty )
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def full_name
    [last_name, first_name].compact.join(' ')
  end

  def admin?
    is_a? Admin
  end
end
