class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests

  scope :simple_level, -> { where level: 0..1 }
  scope :middle_level, -> { where level: 2..4 }
  scope :hard_level, -> { where level: 5..Float::INFINITY }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.sorted_category(category)
    joins(:category)
    .where(categories: { title: category })
    .order(title: :desc).pluck(:title)
  end
end
