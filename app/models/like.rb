class Like < ApplicationRecord

  # Validations
  validates :user, uniqueness: { scope: :tweet, message: "and tweet combination already taken"}
  # Associations
  belongs_to :user
  belongs_to :tweet, counter_cache: true
end
