class User < ApplicationRecord


  # Validations
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

  # Associations
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

  enum role: { member: 0, admin: 1 }
end
