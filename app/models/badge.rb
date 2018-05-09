class Badge < ApplicationRecord
  attr_writer :parameter

  has_many :user_badges
  has_many :users, through: :user_badges
end
